import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:kazpost/app/pages/tests/test_list_page.dart';

class NewQuizPage extends StatefulWidget {
  final int i;

  NewQuizPage({Key key, @required this.i}) : super(key: key);

  @override
  NewQuizPageState createState() => NewQuizPageState(this.i);
}

int questionNumber = 0;

class NewQuizPageState extends State<NewQuizPage> {
  QuizHelper quizHelper = QuizHelper();
  NewQuizPageState(this.i);
  int i;

  Future _getData() async {
    quizHelper.getQuiz();

    await new Future.delayed(new Duration(seconds: 3));
  }

  updateQuiz() {
    setState(() {
      if (questionNumber ==
          quizHelper.data["quizzes"][i]["questions"].length - 1) {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Summary()));
        print('последний вопрос: $questionNumber');
      } else {
        questionNumber++;
        print('обновлен: $questionNumber');
      }
    });
  }

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
    return Scaffold(
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Вопрос ${questionNumber + 1}/',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '${quizHelper.data["quizzes"][i]["questions"].length}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(height: 2, thickness: 2),
          SizedBox(height: 20),
          Text(
            '${quizHelper.data["quizzes"][i]["questions"]["$questionNumber"]["question"]}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF0157A5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: quizHelper
                          .data["quizzes"][i]["questions"]["$questionNumber"]
                          .length -
                      2,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          color: Color(0xFF0157A5),
                          height: 2,
                          thickness: 2,
                        ),
                        ListTile(
                          onTap: () {
                            updateQuiz();
                            print(
                                '${quizHelper.data["quizzes"][i]["questions"]["$questionNumber"]["true"]["C"]}');
                          },
                          leading: Image.asset(
                            'assets/img/radioButton.png',
                            height: 20,
                          ),
                          title: Text(
                            '${quizHelper.data["quizzes"][i]["questions"]["$questionNumber"]["B"]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Правильных: ",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                new Column(),
                new MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    questionNumber = 0;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => TestListPage()));
                  },
                  child: new Text(
                    "Выйти",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
