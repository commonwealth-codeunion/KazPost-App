import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kazpost/app/pages/settings/pages/profile_settings.dart';
import 'package:kazpost/app/pages/settings/pages/security_settings.dart';

final String faq = './assets/img/faq.png';
final String lang = './assets/img/lang.png';
final String lock = './assets/img/lock.png';
final String user = './assets/img/user.png';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String avatar = '';
  String name = '';
  String type = '';

  readAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        avatar = value;
        print(avatar);
      });
    }
  }

  readName() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        name = value;
      });
    }
  }

  readType() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'type';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        type = value;
      });
    }
  }

  @override
  void initState() {
    readAvatar();
    readName();
    readType();
    databaseHelper.getAvatar();
    super.initState();
  }

  final int txtColor = 0xFF8465B7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Настройки',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('$avatar'),
                  radius: 40,
                ),
                SizedBox(height: 15),
                Text(
                  '$name',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE4E2F4),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: Text(
                    "$type",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Color(txtColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 35,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ProfileSettings()),
                      );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        user,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Профиль",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                  // Профиль

                  // Безопасность
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SecuritySettings()),
                      );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        lock,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Безопасность",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                  // Безопасность

                  // Язак приложения
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {},
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        lang,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Язык приложения",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                  // Язык приложения

                  Divider(
                    thickness: 1.5,
                    color: Colors.black12,
                  ),

                  // FAQ
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => FaqSettings()),
                      // );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        faq,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Поддержка. FAQ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FaqSettings {
}
