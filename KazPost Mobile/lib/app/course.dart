import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    './assets/img/monitor.png',
                    width: 360,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
