import 'package:flutter/material.dart';
import 'package:kazpost/app/main_page/pages/homepage.dart';
import 'package:kazpost/app/main_page/pages/worksPage.dart';
import 'package:kazpost/app/main_page/pages/testPage.dart';
import 'package:kazpost/app/main_page/pages/callBackPage.dart';
import 'package:kazpost/app/main_page/pages/settingsPage.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    WorksPage(),
    TestPage(),
    HomePage(),
    CallBackPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0157A5)),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(3),
                    vertical: hp(1),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF0157A5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/avatar.png'),
                          height: hp(20),
                        ),
                      ),
                      Text(
                        'Чингиз Марипбек',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: hp(1),
                      ),
                      Text(
                        'maripbekoff@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(child: Text('Мои данные'), onPressed: () {}),
                    FlatButton(child: Text('Мои курсы'), onPressed: () {}),
                    FlatButton(child: Text('Мои тесты'), onPressed: () {}),
                    FlatButton(
                        child: Text('Мои предложения'), onPressed: () {}),
                    FlatButton(child: Text('Мои достижения'), onPressed: () {}),
                    FlatButton(child: Text('Мои Поддержка'), onPressed: () {}),
                    FlatButton(
                        child: Text('Выйти с аккаунта'), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFC4C4C4),
        iconSize: 27,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0157A5),
        onTap: _onItemTapped,
      ),
    );
  }
}
