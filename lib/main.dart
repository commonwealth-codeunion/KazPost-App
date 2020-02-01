import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazpost/pages/authorization/authorization_page.dart';
import 'package:kazpost/pages/main/main_page.dart';

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
        routes: <String, WidgetBuilder>{
          "/mainpage": (BuildContext context) => SplashMain(),
          "/authpage": (BuildContext context) => AuthPage(),
        },
        home: AuthPage());
  }
}
