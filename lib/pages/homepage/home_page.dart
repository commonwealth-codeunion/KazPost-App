import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:kazpost/app/pages/homepage/files_model.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/pages/homepage/card.dart';
import 'package:kazpost/bloc/files_manager.dart';
import 'package:kazpost/bloc/quiz_bloc.dart';
import 'package:kazpost/models/files_model.dart';
import 'package:kazpost/models/quiz_model.dart';
import 'package:kazpost/pages/quiz/quiz_page.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../methodics/methodics_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

textStyle() {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
}

titleStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  QuizBloc quizBloc = QuizBloc();

  FilesModel filesModel = FilesModel();
  FilesManager filesManager = FilesManager();

  // @override
  // Widget build(BuildContext context) {
  //   var futureBuilder = new FutureBuilder(
  //     future: null,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //         case ConnectionState.waiting:
  //           return Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 CachedNetworkImage(
  //                   imageUrl:
  //                       'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
  //                   width: 300,
  //                   errorWidget: (context, url, error) =>
  //                       Icon(Icons.error_outline),
  //                   placeholder: (context, url) => CircularProgressIndicator(),
  //                 ),
  //                 CircularProgressIndicator(),
  //               ],
  //             ),
  //           );
  //         default:
  //           if (snapshot.hasError) {
  //             return new Text('Error: ${snapshot.error}');
  //           } else
  //             return createListView(context, snapshot);
  //       }
  //     },
  //   );
  //   return Scaffold(
  //     body: futureBuilder,
  //   );
  // }

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     new FlutterLocalNotificationsPlugin();

  // initState() async {
  //   super.initState();
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       '1', 'inducesmile', 'inducesmile flutter snippets',
  //       importance: Importance.Max, priority: Priority.High);
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'Ты лалка', 'смари не пересрись', platformChannelSpecifics,
  //       payload: 'item x');

  //   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  //   var initializationSettingsAndroid =
  //       new AndroidInitializationSettings('mipmap/ic_launcher');
  //   var initializationSettingsIOS = new IOSInitializationSettings(
  //       onDidReceiveLocalNotification: (i, string1, string2, string3) {
  //     print("received notifications");
  //   });
  //   var initializationSettings = new InitializationSettings(
  //       initializationSettingsAndroid, initializationSettingsIOS);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: (string) {
  //     print("selected notification");
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        onRefresh: () async {
          setState(() {
            // quizBloc.getQuiz;

            // quizHelper.getQuiz();

            filesManager.filesList;
          });
        },
        showChildOpacityTransition: false,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 10),
                  StreamBuilder(
                    stream: quizBloc.getQuiz,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Не удалось загрузить последний тест..');
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return RaisedButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => NewQuizPage(
                                //       i: quiz["quizzes"][['quizzes'].length],
                                //     ),
                                //   ),
                                // );
                              },
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              color: Color(0xFFEC4B4B),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text('Загрузка..'),
                            );
                          case ConnectionState.done:
                            return RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewQuizPage(
                                      i: quiz["quizzes"].length - 1,
                                    ),
                                  ),
                                );
                              },
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              color: Color(0xFFEC4B4B),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                  '${quiz["quizzes"][quiz["quizzes"].length - 1]["title"]}'),
                            );
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Здесь вы можете найти\nполезные курсы для себя',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'Название курса',
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0157A5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: <Widget>[
                      CardWidget("Мониторинг", 0xFFFF7043, Icons.camera),
                      CardWidget("Учёт и аудит", 0xFF42A5F5, Icons.category),
                      CardWidget("Администрирование", 0xFFFFA726, Icons.people),
                      CardWidget("Инфо - системы", 0xFF182B88, Icons.settings),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  StreamBuilder(
                    stream: filesManager.filesList,
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Error: Нет доступа к интернету',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.done:
                            return ListView.builder(
                              itemCount: collection["latestFiles"].length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Card(
                                    elevation: 2,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    MethodicsPage(i: index)));
                                      },
                                      leading: Image.asset('assets/img/pdf.png',
                                          width: 40),
                                      title: Text(
                                          '${collection["latestFiles"][index]["title"]}'),
                                      subtitle: Text(
                                        '${collection["latestFiles"][index]["description"]}',
                                      ),
                                      trailing: DropdownButton<String>(
                                        items: <String>['Загрузить']
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        underline: Container(),
                                        onChanged: (value) {
                                          launch(
                                              '${collection["latestFiles"][index]["href"]}');
                                        },
                                        icon: Icon(Icons.more_vert),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                        }
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 10000) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "В разработке",
            ),
          )
        ],
      );
    }
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
