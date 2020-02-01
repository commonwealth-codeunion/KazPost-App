import 'package:flutter/material.dart';
import 'new_course_page.dart';

class CourseListWidget extends StatelessWidget {
  final String title;
  final int count;
  final String icon;
  const CourseListWidget(this.title, this.count, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewCoursePage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      icon,
                      color: Color(0xFF0157A5),
                      width: 25,
                    ),
                    SizedBox(width: 22),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(fontSize: 17),
                        ),
                        Text("$count глав")
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Продолжить учиться",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF4CAF50),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
