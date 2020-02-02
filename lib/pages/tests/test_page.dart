import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/pages/courses/course_list.dart';
import 'package:kazpost/pages/docs/docs_page.dart';
import 'package:kazpost/pages/tests/test_list_page.dart';

final String call = './assets/img/call.svg';
// final Widget callSvg = SvgPicture.asset(
//   call,
//   width: 25,
//   height: 25,
// );

class TestPageBar extends StatefulWidget {
  TestPageBar({Key key}) : super(key: key);

  @override
  _TestPageBarState createState() => _TestPageBarState();
}

class _TestPageBarState extends State<TestPageBar> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "Тесты и курсы",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Мои Курсы",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "12 курсов",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseList(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PdfView()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "./assets/img/eye.png",
                                  color: Color(0xFF0157A5),
                                  width: 25,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Курсы по мониторингу",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
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
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
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
                        // databaseHelper.getFiles();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "./assets/img/calculator.png",
                                  color: Color(0xFF0157A5),
                                  width: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Курсы по учету и аудиту",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
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
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: Color(0xFF0157A5)),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Мои тесты",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestListPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Card(
                      margin: EdgeInsets.zero,
                      color: Color(0xFF0C3D69),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  // callSvg,
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Тест по 29 декабря",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Пройти тест",
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
