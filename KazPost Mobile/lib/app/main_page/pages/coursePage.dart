import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
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
            ],
          ),
        ],
      ),
    );
  }
}
