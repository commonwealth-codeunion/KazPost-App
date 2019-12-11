import 'package:flutter/material.dart';

import '../../quiz.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Тестирование',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFF4CAF50)),
                      child: Center(
                          child:
                              Text('2', style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Color(0xFF6858D6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Image(
                                image: AssetImage('./assets/img/eye.png'),
                                height: 30,
                                width: 30,
                                color: Color(0xFF6858D6),
                              ),
                            ),
                            SizedBox(width: 30),
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
                                SizedBox(height: 20),
                                Container(
                                  height: 3,
                                  constraints: BoxConstraints(
                                      minWidth: 100, maxWidth: 250),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                ),
                                SizedBox(height: 10),
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
                                        builder: (context) => QuizPage()));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 50,
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
                SizedBox(height: 30),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFF6858D6),
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Image(
                                image:
                                    AssetImage('./assets/img/calculator.png'),
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Вам доступен курс "Мониторинг"\n',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  'Хотим уведомить вас о том,\nчто теперь вам доступен\nновый курс',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 3,
                                  constraints: BoxConstraints(
                                      minWidth: 100, maxWidth: 250),
                                  decoration:
                                      BoxDecoration(color: Color(0xFFEFEFEF)),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 мин назад',
                              style: TextStyle(color: Colors.black),
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
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 50,
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
