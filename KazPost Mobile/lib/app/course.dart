import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return FlatButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.zero,
            height: hp(14),
            width: wp(55),
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
                size: 42,
              ),
              alignment: Alignment.topRight,
            ),
          ),
          Container(
            height: hp(16),
            width: wp(55),
            padding: EdgeInsets.symmetric(
              vertical: hp(3),
              horizontal: wp(3),
            ),
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
              children: <Widget>[
                Text(
                  'Мониторинг',
                  style: TextStyle(
                    color: Color(0xFF0157A5),
                  ),
                ),
                SizedBox(
                  height: hp(2),
                ),
                Text(
                  'Курсы по мониторингу',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: hp(1),
                ),
                Text(
                  '11 глав',
                  style: TextStyle(
                    color: Colors.black26,
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
