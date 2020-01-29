import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:kazpost/app/pages/homepage/files_model.dart';
import 'package:kazpost/app/pages/methodics/methodics_page.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/bloc/files_manager.dart';
import 'package:kazpost/bloc/quiz_bloc.dart';
import 'package:kazpost/models/files_model.dart';
import 'package:kazpost/pages/tests/test_list_page.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

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
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {
                      quizBloc.getQuiz;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestListPage()),
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
                      'пока-что, так. потом поменяю',
                      // '${quizHelper.data["quizzes"][0]["title"]}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 10,
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
                    height: 10,
                  ),
                  Text(
                    'ОБУЧЕНИЕ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'МАТЕРИАЛЫ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
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
                                      title: Text('${collection["latestFiles"][index]["title"]}'),
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
                                          launch('${collection["latestFiles"][index]["href"]}');
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
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: () {
                      // quizHelper.getQuiz();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ForegroundNotification()));
                    },
                    child: Text('Больше материалов..'),
                    textColor: Color(0xFF0157A5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Color(0xFF0157A5),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
