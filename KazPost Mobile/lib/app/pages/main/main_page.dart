import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:kazpost/app/authorization/authorization_page.dart';
import 'package:kazpost/app/pages/callback/call_back_page.dart';
import 'package:kazpost/app/pages/courses/course_list.dart';
import 'package:kazpost/app/pages/tests/test_list_page.dart';
import 'package:kazpost/app/pages/homepage/home_page.dart';
import 'package:kazpost/app/pages/notifications/notification_page.dart';
import 'package:kazpost/app/pages/profile/profile_page.dart';
import 'package:kazpost/app/pages/settings/settings_page.dart';
import 'package:kazpost/app/pages/tests/test_page.dart';
import 'package:kazpost/app/pages/works/works_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashMain extends StatelessWidget {
  const SplashMain({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new MainPage(),
      image: new Image.network(
        'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
        gaplessPlayback: true,
      ),
      backgroundColor: Colors.white,
      photoSize: 100,
      loaderColor: Color(0xFF0157A5),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String name = '';
  String email = '';
  String avatar = '';

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
    readName();
    readEmail();
    readAvatar();
  }

  int _selectedIndex = 0;

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorksPage()),
              );
            },
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
                  backgroundImage: NetworkImage('$avatar'),
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
                databaseHelper.logOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthPage(),
                  ),
                );
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
            icon: Icon(Icons.people_outline),
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
