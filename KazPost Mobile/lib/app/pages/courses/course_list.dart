import 'package:flutter/material.dart';
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
              SizedBox(height: 10),
              Text(
                "Мониторинг",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CourseListWidget("Мониторинг", 12, icon1),
              SizedBox(height: 20),
              Text(
                "Учет и аудит",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CourseListWidget("Учет и аудит", 12, icon1),
              SizedBox(height: 20),
              Text(
                "IKEA",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CourseListWidget("Как собрать стул", 12, icon1),
            ],
          ),
        ],
      ),
    );
  }
}
