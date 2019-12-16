import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:kazpost/app/course.dart';

import '../../quiz.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(4),
          vertical: hp(1),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Уведомления',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: wp(10),
                      height: hp(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF4CAF50)),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: hp(2),
                ),
                Card(
                  color: Color(0xFF6858D6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(4),
                      vertical: hp(2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: wp(3),
                                vertical: hp(1.5),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Image(
                                image: AssetImage('./assets/img/eye.png'),
                                height: hp(4),
                                width: wp(8),
                                color: Color(0xFF6858D6),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Вы должны пройти тест\n',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Хотим уведомить вас о том,\nчто теперь вам доступен\nновый курс',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: hp(2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 мин назад',
                              style: TextStyle(color: Colors.white),
                            ),
                            OutlineButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizPage(),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: hp(1),
                                horizontal: wp(8),
                              ),
                              borderSide: BorderSide(color: Colors.white),
                              child: Text(
                                'Начать',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: hp(2),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(4),
                      vertical: hp(2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: wp(3),
                                vertical: hp(1.5),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF6858D6),
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Image(
                                image: AssetImage('./assets/img/eye.png'),
                                height: hp(4),
                                width: wp(8),
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Вы должны пройти тест\n',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Хотим уведомить вас о том,\nчто теперь вам доступен\nновый курс',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: hp(2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 мин назад',
                              style: TextStyle(color: Colors.black26),
                            ),
                            OutlineButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuizPage()));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: hp(1),
                                horizontal: wp(8),
                              ),
                              borderSide: BorderSide(color: Color(0xFF6858D6)),
                              child: Text(
                                'Начать',
                                style: TextStyle(color: Color(0xFF6858D6)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
