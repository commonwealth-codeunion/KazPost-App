import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.zero,
            height: 100,
            width: 230,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: ExactAssetImage('assets/img/monitoring.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 30,
              ),
              alignment: Alignment.topRight,
            ),
          ),
          Container(
            width: 230,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Мониторинг',
                  style: TextStyle(
                    color: Color(0xFF0157A5),
                    fontSize: 13,
                  ),
                ),
                Text(
                  'Курсы по мониторингу',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  '11 глав',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
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
