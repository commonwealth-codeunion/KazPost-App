import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class CourseListWidget extends StatelessWidget {
  final String title;
  final int count;
  final String icon;
  const CourseListWidget(this.title, this.count, this.icon);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
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
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: wp(8),
              vertical: hp(4),
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
                    SizedBox(width: wp(5)),
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
                SizedBox(height: hp(2)),
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
