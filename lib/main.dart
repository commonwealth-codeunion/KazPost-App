// import 'dart:isolate';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:kazpost/models/quiz_model.dart';
import 'package:kazpost/pages/authorization/authorization_page.dart';
import 'package:kazpost/pages/errors/refresh_token_error.dart';
import 'package:kazpost/pages/main/main_page.dart';
// import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kazpost/bloc/quiz_bloc.dart';

// void printHello() {
// final DateTime now = DateTime.now();
// final int isolateId = Isolate.current.hashCode;
// print("[$now] Привет мир! isolate=$isolateId function='$printHello'");
// }

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();

QuizBloc quizBloc = QuizBloc();

backgroundFetchHeadlessTask() async {
  BackgroundFetch.configure(
      BackgroundFetchConfig(
          minimumFetchInterval: 15,
          enableHeadless: true,
          stopOnTerminate: false,
          startOnBoot: true,
          requiredNetworkType: BackgroundFetchConfig.NETWORK_TYPE_ANY),
      () async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'numberOfQuizzes';
    int numberOfQuizzes = prefs.getInt(key);

    quizBloc.getQuiz;

    if (numberOfQuizzes > 5) {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          '1', 'inducesmile', 'inducesmile flutter snippets',
          importance: Importance.Max, priority: Priority.High);
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0, 'Ты лалка', 'смари не пересрись', platformChannelSpecifics,
          payload: 'item x');

      // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      var initializationSettingsAndroid =
          new AndroidInitializationSettings('mipmap/ic_launcher');
      var initializationSettingsIOS = new IOSInitializationSettings(
          onDidReceiveLocalNotification: (i, string1, string2, string3) {
        print("received notifications");
        return null;
      });
      var initializationSettings = new InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (string) {
        print("selected notification");
        return null;
      });
    }
    BackgroundFetch.finish();
  });
}

void main() {
  // final int helloAlarmId = 0;

  // WidgetsFlutterBinding.ensureInitialized();

  // await AndroidAlarmManager.initialize();
  runApp(MyApp());

  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  // await AndroidAlarmManager.periodic(const Duration(seconds: 30), helloAlarmId, printHello);
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
          "/mainpage": (BuildContext context) => SplashMain(),
          "/authpage": (BuildContext context) => AuthPage(),
        },
        home: AuthPage());
  }
}
