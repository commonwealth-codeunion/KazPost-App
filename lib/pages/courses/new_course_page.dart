import 'package:flutter/material.dart';
import 'package:kazpost/pages/courses/new_course_page_widget.dart';

class NewCoursePage extends StatelessWidget {
  const NewCoursePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Курсы по мониторингу",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NewCoursePageWidget(0xFF4CAF50),
          Text(
            "Базовые\nпонятия",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xFF0157A5),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  NewCoursePageWidget(0),
                  Text(
                    "Углубление",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0157A5),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  NewCoursePageWidget(0),
                  Text(
                    "Практика",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color(0xFF0157A5),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
