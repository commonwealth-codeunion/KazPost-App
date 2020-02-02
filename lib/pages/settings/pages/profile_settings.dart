import 'package:flutter/material.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  String avatar = '';
  String name = '';
  String email = '';

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

  readEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        email = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readAvatar();
    readName();
    readEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Назад"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Профиль",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: avatar.isNotEmpty ? NetworkImage(avatar) : null,
              radius: 30,
            ),
            SizedBox(height: 20),
            Text(
              "Имя и фамилия: $name\nВаш логин: $email",
            ),
          ],
        ),
      ),
    );
  }
}
