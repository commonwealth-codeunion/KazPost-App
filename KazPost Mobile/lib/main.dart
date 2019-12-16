import 'package:flutter/material.dart';
import 'package:kazpost/app/main_page/pages/homepage.dart';
import 'package:flutter/services.dart';
import 'app/main_page/mainPage.dart';
import 'package:kazpost/start/authpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KazPost',
      theme: ThemeData(
        primaryColor: Colors.white,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Color(0xFFCFCFCF),
        ),
        fontFamily: 'Roboto',
      ),
      home: MainPage(),
    );
  }
}
