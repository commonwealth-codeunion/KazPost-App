import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:kazpost/app/pages/quiz/new_quiz_page.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TestListPage extends StatefulWidget {
  TestListPage({Key key}) : super(key: key);

  @override
  _TestListPageState createState() => _TestListPageState();
}

class _TestListPageState extends State<TestListPage> {
  QuizHelper quizHelper = QuizHelper();

  int numberOfQuizzes;

  Future _getData() async {
    quizHelper.getQuiz();

    await new Future.delayed(new Duration(seconds: 3));
  }

  String icon = './assets/img/eye.png';

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl:
                        'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
                    width: 300,
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline),
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          default:
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            } else
              return createListView(context, snapshot);
        }
      },
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Тесты",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        titleSpacing: -3,
        elevation: 0,
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new LiquidPullToRefresh(
      onRefresh: () async {
        _getData();
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => TestListPage()));
      },
      showChildOpacityTransition: true,
      child: new ListView.builder(
        itemCount: numberOfQuizzes = quizHelper.data["quizzes"].length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: -10,
                  ),
                ],
              ),
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NewQuizPage(
                                  i: index,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Image.asset(
                                  icon,
                                  color: Color(0xFF0157A5),
                                  width: 45,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${quizHelper.data["quizzes"][index]["title"]}\n\n',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          '${quizHelper.data["quizzes"][index]["description"]}}',
                                      style: TextStyle(
                                          color: Color(0xFFC0C0C0),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Пройти тестирование",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
