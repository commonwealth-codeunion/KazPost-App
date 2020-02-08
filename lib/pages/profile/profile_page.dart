import 'package:flutter/material.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/pages/certificates/certificates_page.dart';
import 'package:kazpost/pages/profile/views/first_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String type = '';
  String avatar = '';
  String position = '';

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

  readAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        avatar = value;
      });
    }
  }

  readPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'position';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      setState(() {
        position = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readName();
    readType();
    readAvatar();
    readPosition();
  }

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Color(0xFF0157A5),
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(top: 75),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: CircleAvatar(
                        backgroundImage: avatar.isNotEmpty ? NetworkImage(avatar) : null,
                        radius: 60,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 95,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ],
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
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF0157A5).withOpacity(0.5),
                  blurRadius: 20.0,
                  spreadRadius: -5,
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
                  "$name",
                  style: TextStyle(
                    color: Color(0xFF0157A5),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$position',
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "$type",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xFF4CAF50),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Certificates(),
                      ),
                    );
                  },
                  child: Text(
                    "Достижения",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                appBar: TabBar(
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
                body: TabBarView(
                  
                  children: <Widget>[
                    FirstViewProfile(),
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessibility_new),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
