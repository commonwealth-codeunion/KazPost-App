import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/bloc/quiz_bloc.dart';
import 'package:kazpost/models/quiz_model.dart';
import 'package:kazpost/pages/quiz/summary_page.dart';

class NewQuizPage extends StatefulWidget {
  NewQuizPage({Key key, @required this.i}) : super(key: key);

  final int i;

  @override
  _NewQuizPageState createState() => _NewQuizPageState(this.i);
}

int questionNumber = 0;
int score = 0;

class _NewQuizPageState extends State<NewQuizPage> {
  int i;
  _NewQuizPageState(this.i);

  QuizBloc quizBloc = QuizBloc();

  // Future _getData() async {
  //   quizHelper.getQuiz();

  //   await new Future.delayed(new Duration(seconds: 3));
  // }

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
  //   return WillPopScope(
  //     onWillPop: () async => false,
  //     child: Scaffold(
  //       body: futureBuilder,
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: quizBloc.getQuiz,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
                ),
                Text(
                  'Нет подключения к сети..',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            case ConnectionState.done:
              return Quiz(this.i);
          }
        }
      },
    );
  }
}

class Quiz extends StatefulWidget {
  final int i;
  Quiz(this.i);

  @override
  QuizState createState() => QuizState(this.i);
}

class QuizState extends State<Quiz> {
  QuizBloc quizBloc = QuizBloc();
  QuizState(this.i);
  int i;

  updateQuestion() {
    setState(() {
      if (questionNumber == quiz["quizzes"][i]["questions"].length - 1) {
        if (score >= quiz["quizzes"][i]["questions"].length / 2) {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => Summary(
                0xFF0157A5,
                0xFF77B9F7,
                "ОТЛИЧНО!",
                "Успехов!",
                Icons.beenhere,
              ),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => Summary(
                0xFFB93D35,
                0xFFFF7043,
                "ПЛОХО!",
                "Обучайтесь лучше",
                Icons.warning,
              ),
            ),
          );
        }
        print('последний вопрос: $questionNumber');
      } else {
        print('обновлен: $questionNumber');
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(40),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Вопрос ${questionNumber + 1}/',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${quiz["quizzes"][i]["questions"].length}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 20),
              Text(
                '${quiz["quizzes"][i]["questions"]["$questionNumber"]["question"]}?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF0157A5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz["quizzes"][i]["questions"]["$questionNumber"]
                          ["answers"]
                      .length,
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
                            if (quiz["quizzes"][i]["questions"]
                                        ["$questionNumber"]["true"]
                                    .indexOf(index) !=
                                -1) {
                              print("Правильный ответ");
                              score++;
                              print(score);
                            } else {
                              print("Не правильно");
                            }
                            updateQuestion();
                          },
                          leading: Image.asset(
                            'assets/img/radioButton.png',
                            height: 20,
                          ),
                          title: Text(
                            '${quiz["quizzes"][i]["questions"]["$questionNumber"]["answers"][index]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
