import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:kazpost/app/pages/courses/course_list_widget.dart';

String icon1 = "./assets/img/eye.png";

class CourseList extends StatefulWidget {
  CourseList({Key key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Курсы",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        titleSpacing: -3,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: hp(2)),
              Text(
                "Мониторинг",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hp(2)),
              CourseListWidget("Мониторинг", 12, icon1),
              SizedBox(height: hp(4)),
              Text(
                "Учет и аудит",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hp(2)),
              CourseListWidget("Учет и аудит", 12, icon1),
              SizedBox(height: hp(4)),
              Text(
                "IKEA",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hp(2)),
              CourseListWidget("Как собрать стул", 12, icon1),
            ],
          ),
        ],
      ),
    );
  }
}
