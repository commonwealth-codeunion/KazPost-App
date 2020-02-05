import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/models/quiz_model.dart';
import 'package:kazpost/pages/callback/call_back_page.dart';
import 'package:kazpost/pages/courses/course_list.dart';
import 'package:kazpost/pages/notifications/notification_page.dart';
import 'package:kazpost/pages/profile/profile_page.dart';
import 'package:kazpost/pages/settings/settings_page.dart';
import 'package:kazpost/pages/tests/test_list_page.dart';
import 'package:kazpost/pages/tests/test_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homepage/home_page.dart';

int numberOfQuizzes = 0;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();

initialiseNotifications() async {
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('mipmap/kazposst');
  var initializationSettingsIOS = new IOSInitializationSettings(
      onDidReceiveLocalNotification: (i, string1, string2, string3) {
    print("received notifications");
    return null;
  });
  var initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (string) {
    print("selected notification");
    return null;
  });

  print('Инициализация плагина прошла успешно!');
}

pushNotifications() async {
  await QuizModel.getQuiz();
  await initialiseNotifications();

  final prefs = await SharedPreferences.getInstance();
  final key = 'numberOfQuizzes';
  final value = prefs.getInt(key) ?? '';
  if (value != '') {
    numberOfQuizzes = value;
  }

  print(
      'До условия(numberOfQuizzes): $numberOfQuizzes\nДо условия(запрос): ${quiz["quizzes"].length}');

  if (numberOfQuizzes < quiz["quizzes"].length) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '1',
      'kazpost',
      'kazpost by Code Union',
      importance: Importance.Max,
      priority: Priority.High,
      color: Colors.blue,
      style: AndroidNotificationStyle.BigText,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        quiz["quizzes"][quiz["quizzes"].length - 1]["title"],
        'Вышел новый тест. На забудте его пройти\n${quiz["quizzes"][quiz["quizzes"].length - 1]["description"]}',
        platformChannelSpecifics,
        payload: 'item x');
    QuizModel.saveNumberOfQuizzes(quiz["quizzes"].length);

    print(
        'Новый тест(numberOfQuizzes): $numberOfQuizzes\nНовый тест(запрос): ${quiz["quizzes"].length}');

    print('Новый тест вышел');
  } else {
    numberOfQuizzes = quiz["quizzes"].length;
    QuizModel.saveNumberOfQuizzes(numberOfQuizzes);

    print(
        'Нету тестов(numberOfQuizzes): $numberOfQuizzes\nНету тестов(запрос): ${quiz["quizzes"].length}');
    print('Новых тестов нету');
  }
}

Future<void> initPlatformState() async {
  await AndroidAlarmManager.periodic(
      const Duration(seconds: 30), 0, pushNotifications);
}

// class SplashMain extends StatelessWidget {
//   const SplashMain({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 3,
//       navigateAfterSeconds: new MainPage(),
//       image: new Image.network(
//         'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
//         gaplessPlayback: true,
//       ),
//       backgroundColor: Colors.white,
//       photoSize: 100,
//       loaderColor: Color(0xFF0157A5),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseHelper _databaseHelper = new DatabaseHelper();

  String name = '';
  String email = '';
  String avatar = '';
  final int newTestAlarm = 0;

  readName() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        name = value;
      });
    }
  }

  readEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        email = value;
      });
    }
  }

  readAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        avatar = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    readName();
    readEmail();
    readAvatar();
  }

  int _selectedIndex = 2;

  static List<Widget> _widgetOptions = <Widget>[
    TestPageBar(),
    TestPage(),
    HomePage(),
    CallBackPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0157A5)),
        elevation: 4,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0157A5),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: CircleAvatar(
                  backgroundImage:
                      avatar.isNotEmpty ? NetworkImage(avatar) : null,
                  radius: 80,
                ),
              ),
              accountName: new Text(
                '$name',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: new Text(
                '$email',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('Мои данные'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Мои курсы'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseList(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Мои тесты'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestListPage()),
                );
              },
            ),
            ListTile(
              title: Text('Мои предложения'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallBackPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Поддержка'),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Выйти с аккаунта',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                _databaseHelper.logOut();
                Navigator.pushReplacementNamed(context, '/authpage');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFC4C4C4),
        iconSize: 27,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0157A5),
        onTap: _onItemTapped,
      ),
    );
  }
}
