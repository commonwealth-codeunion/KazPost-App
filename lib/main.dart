import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazpost/pages/authorization/authorization_page.dart';
import 'package:kazpost/pages/errors/refresh_token_error.dart';
import 'package:kazpost/pages/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String accessToken = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return buildError(context, errorDetails);
        };

        return widget;
      },
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
        "/mainpage": (BuildContext context) => MainPage(),
        "/authpage": (BuildContext context) => AuthPage(),
      },
      home: FutureBuilder(
        future: readToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}

readToken() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'accessToken';
  final value = prefs.get(key) ?? null;
  if (value != null) {
    print('У пользователя есть accessToken: $value');
    return accessToken = value;
  } else {
    print('У пользователя нету acessToken: $value');
  }
}
