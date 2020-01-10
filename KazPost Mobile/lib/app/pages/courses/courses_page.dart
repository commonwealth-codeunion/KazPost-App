import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'courses_page_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: hp(30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: new ExactAssetImage(
                      './assets/img/courses.jpeg',
                    ),
                  ),
                ),
              ),
              Container(
                height: hp(30),
                decoration: BoxDecoration(
                  color: Color(0xFF0157A5).withOpacity(0.795),
                ),
              ),
              Container(
                height: hp(30),
                alignment: Alignment.center,
                child: Text(
                  'Курсы по мониторингу',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '1 неделя',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Container(
                  height: hp(23),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.55,
                    ),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      CoursePageWidget('1 урок', 'Основы'),
                      CoursePageWidget('2 урок', 'Основы'),
                      CoursePageWidget('3 урок', 'Основы'),
                      CoursePageWidget('4 урок', 'Основы'),
                    ],
                  ),
                ),
                Text(
                  '2 неделя',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Container(
                  height: hp(23),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.55,
                    ),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      CoursePageWidget('5 урок', 'Основы'),
                      CoursePageWidget('6 урок', 'Основы'),
                      CoursePageWidget('7 урок', 'Основы'),
                      CoursePageWidget('8 урок', 'Основы'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
