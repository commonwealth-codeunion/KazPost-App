import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Вопрос ${questionNumber + 1}/${quiz.questions.length}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Правильных: $finalScore",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 3,
                decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
              ),
              Text("${quiz.questions[questionNumber]}"),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(
                      quiz.choices[questionNumber][0],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][1] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(
                      quiz.choices[questionNumber][1],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][2] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(
                      quiz.choices[questionNumber][2],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(
                      quiz.choices[questionNumber][3],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: new MaterialButton(
                  minWidth: 240.0,
                  height: 30.0,
                  onPressed: resetQuiz,
                  child: new Text(
                    'Выйти',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new QuizData();

class QuizData {
  var questions = [
    "Когда начался KazPost хакатон?",
    "Что означает “мониторинг” в переводе с латинского языка?",
    "На чем написано это приложение?",
    "Какое название нашей команды?",
    "Как зовут первого спикера в первый день хакатона?",
  ];

  var choices = [
    ["Сегодня", "Вчера", "Когда-то", "Нет ответа"],
    ["Наблюдающий", "Надзирающий", "Смотрящий", "Защищающий"],
    ["Java", "C++", "Kotlin", "Flutter"],
    ["Code Union[Vigil]", "Code Union", "IT-Energy", "Пожилые"],
    ["Гульбану", "Айгерим", "Рассул", "Гульдана"],
  ];

  var correctAnswers = [
    "Нет ответа",
    "Смотрящий",
    "Flutter",
    "Code Union",
    "Айгерим",
  ];
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Правильных: $score",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Перезапустить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
