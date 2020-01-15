import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';

import '../quiz/quiz_page.dart';

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
  QuizHelper quizHelper = QuizHelper();

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        onRefresh: () async {
          quizHelper.getQuiz();
        },
        showChildOpacityTransition: false,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      quizHelper.getQuiz();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
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
                  OutlineButton.icon(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    label: Expanded(
                      child: Text(
                        'Название курса',
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ),
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
