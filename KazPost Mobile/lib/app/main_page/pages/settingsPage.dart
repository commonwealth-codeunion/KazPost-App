import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Настройки',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7C977),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/calculator.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      label: Text(
                        "Электронный адрес",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFC57C62),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/calculator.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      label: Text(
                        "Телефонный номер",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF004477),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/calculator.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      label: Text(
                        "Изменить пароль",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF7E89FD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/calculator.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      label: Text(
                        "Приватность",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7C977),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(
                          image: AssetImage('./assets/img/calculator.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      label: Text(
                        "Язык",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
