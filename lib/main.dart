import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazpost/pages/authorization/authorization_page.dart';
import 'package:kazpost/pages/errors/refresh_token_error.dart';
import 'package:kazpost/pages/main/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(MyApp());

  // BackgroundFetch.registerHeadlessTask(pushNotifications);
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
        home: AuthPage());
  }
}
