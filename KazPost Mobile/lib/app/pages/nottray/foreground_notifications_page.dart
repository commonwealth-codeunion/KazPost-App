import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ForegroundNotification extends StatefulWidget {
  @override
  _ForegroundNotificationState createState() => _ForegroundNotificationState();
}

class _ForegroundNotificationState extends State<ForegroundNotification> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initNotifications();
  }

  _onTap() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1', 'inducesmile', 'inducesmile flutter snippets',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'Ты лалка',
        'смари не пересрись', platformChannelSpecifics,
        payload: 'item x');
  }

  initNotifications() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: (i, string1, string2, string3) {
      print("received notifications");
    });
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (string) {
      print("selected notification");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('')),
      body: Center(
        child: RaisedButton(
          child: Text("Врошебная кнопочка"),
          onPressed: _onTap,
          color: Colors.red,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
