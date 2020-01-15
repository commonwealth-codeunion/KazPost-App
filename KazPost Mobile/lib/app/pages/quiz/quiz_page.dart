import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  QuizHelper quizHelper = QuizHelper();

  String question;

  readQuestion() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'question';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        question = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readQuestion();
  }

  void updateQuestion() {
    setState(
      () {
        if (questionNumber == quiz.questions.length - 1) {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new Summary(
                score: finalScore,
              ),
            ),
          );
        } else {
          questionNumber++;
        }
      },
    );
  }

  void resetQuiz() {
    setState(
      () {
        Navigator.pop(context);
        finalScore = 0;
        questionNumber = 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
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
                ],
              ),
              SizedBox(height: 5),
              Divider(
                thickness: 3,
                color: Colors.black26,
              ),
              SizedBox(height: 5),
              Text(
                "$question",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new OutlineButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    color: Color(0xFF0157A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    borderSide: BorderSide(
                      color: Color(0xFF0157A5),
                      width: 2,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          quiz.choices[questionNumber][0],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Image(
                          image: AssetImage('assets/img/radioButton.png'),
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new OutlineButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    color: Color(0xFF0157A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    borderSide: BorderSide(
                      color: Color(0xFF0157A5),
                      width: 2,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          quiz.choices[questionNumber][1],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Image(
                          image: AssetImage('assets/img/radioButton.png'),
                          height: (3.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (2),
                  ),
                  new OutlineButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: (2),
                      vertical: (1),
                    ),
                    color: Color(0xFF0157A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    borderSide: BorderSide(
                      color: Color(0xFF0157A5),
                      width: 2,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          quiz.choices[questionNumber][2],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Image(
                          image: AssetImage('assets/img/radioButton.png'),
                          height: (3.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (2),
                  ),
                  new OutlineButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: (2),
                      vertical: (1),
                    ),
                    color: Color(0xFF0157A5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    borderSide: BorderSide(
                      color: Color(0xFF0157A5),
                      width: 2,
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          quiz.choices[questionNumber][3],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Image(
                          image: AssetImage('assets/img/radioButton.png'),
                          height: (3.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: new MaterialButton(
                  minWidth: 240.0,
                  height: 30.0,
                  onPressed: () {
                    resetQuiz();
                  },
                  child: new Text(
                    'Выйти',
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
    ["Сегодня", "Вчера", "Когда-то", "Нет правильного ответа"],
    ["Наблюдающий", "Надзирающий", "Смотрящий", "Защищающий"],
    ["Java", "C++", "Kotlin", "Flutter"],
    ["Code Union[Vigil]", "Code Union", "IT-Energy", "Пожилые"],
    ["Гульбану", "Айгерим", "Рассул", "Гульдана"],
  ];

  var correctAnswers = [
    "Нет правильного ответа",
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
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Правильных: $score",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                new Column(),
                new MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pop(context);
                  },
                  child: new Text(
                    "Перезапустить",
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
