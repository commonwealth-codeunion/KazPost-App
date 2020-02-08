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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        onRefresh: () async {},
        showChildOpacityTransition: false,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                  SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                    childAspectRatio: 1.4,
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
                                            builder: (context) => MethodicsPage(
                                                fileId:
                                                    collection["latestFiles"]
                                                        [index]["filename"]),
                                          ),
                                        );
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
