import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:kazpost/app/pages/nottray/foreground_notifications_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../courses/course_bookmark.dart';
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
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: hp(2)),
                  RaisedButton(
                    onPressed: () {
                      quizHelper.getQuiz();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: hp(2),
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
                    height: hp(2),
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
                    height: hp(2),
                  ),
                  OutlineButton.icon(
                    padding: EdgeInsets.symmetric(
                      horizontal: hp(1),
                      vertical: wp(1),
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(1),
                          horizontal: wp(2),
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
                  SizedBox(
                    height: hp(2),
                  ),
                  Text(
                    'ОБУЧЕНИЕ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  Container(
                    height: hp(32),
                    child: PageView(
                      controller: PageController(
                        viewportFraction: 0.67,
                      ),
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        CourseWidget(),
                        CourseWidget(),
                        CourseWidget(),
                        CourseWidget(),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Color(0xFFC0C0C0),
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  Text(
                    'МАТЕРИАЛЫ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: wp(4),
                              vertical: hp(2),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xFFC57C62),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: hp(4),
                              width: wp(8),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text('Мониторинг'),
                              SizedBox(
                                height: hp(1),
                              ),
                              LinearPercentIndicator(
                                width: wp(17),
                                lineHeight: hp(1),
                                percent: 0.2,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF0157A5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: wp(4),
                              vertical: hp(2),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xFFC57C62),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: hp(4),
                              width: wp(8),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text('Учет и аудит'),
                              SizedBox(
                                height: hp(1),
                              ),
                              LinearPercentIndicator(
                                width: wp(17),
                                lineHeight: hp(1),
                                percent: 0.2,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF0157A5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hp(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: wp(4),
                              vertical: hp(2),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xFFC57C62),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: hp(4),
                              width: wp(8),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text('Связь'),
                              SizedBox(
                                height: hp(1),
                              ),
                              LinearPercentIndicator(
                                width: wp(17),
                                lineHeight: hp(1),
                                percent: 0.2,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF0157A5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: hp(2),
                  ),
                  OutlineButton(
                    padding: EdgeInsets.symmetric(vertical: hp(2)),
                    onPressed: () {
                      quizHelper.getQuiz();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForegroundNotification()));
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
                  SizedBox(height: hp(2)),
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
