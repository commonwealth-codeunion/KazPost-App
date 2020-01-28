import 'package:flutter/material.dart';

class TestListWidget extends StatelessWidget {
  final String title;
  final String icon;
  const TestListWidget(this.title, this.icon);
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
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
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
                    SizedBox(width: 15),
                    Text(
                      title,
                      style: TextStyle(fontSize: 17),
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
