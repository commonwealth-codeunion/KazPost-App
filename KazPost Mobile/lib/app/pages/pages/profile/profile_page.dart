import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    color: Color(0xFF0157A5),
                    height: hp(25),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: hp(14)),
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Image.asset(
                      './assets/img/ava.png',
                      height: hp(20),
                    ),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      "Назад",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    titleSpacing: -3,
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: hp(3),
                ),
                width: wp(85),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(50, 1, 87, 165),
                      blurRadius: 20.0,
                      spreadRadius: 3,
                      offset: Offset(
                        0.0,
                        20.0,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Нурали Батыр",
                      style: TextStyle(
                        color: Color(0xFF0157A5),
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: hp(2)),
                    Text(
                      'Раб. АО "КазПочта"',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: hp(2)),
                    Text(
                      "IT DIRECTOR",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: hp(5)),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(7),
                        vertical: hp(1.5),
                      ),
                      color: Color(0xFF4CAF50),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "Достижения",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hp(5),
              ),
              DefaultTabController(
                length: 3,
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: "Статистика",
                    ),
                    Tab(
                      text: "Данные",
                    ),
                    Tab(
                      text: "Поддержка",
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
