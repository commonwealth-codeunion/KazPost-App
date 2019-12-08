import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          tabBarTheme: TabBarTheme(
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xFFCFCFCF),
          ),
          fontFamily: 'Roboto'),
      title: 'KazPost',
      home: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Container(
                margin: const EdgeInsets.all(80.0),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Вход'),
                  Tab(text: 'Регистрация'),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Логин',
                                    filled: true,
                                    fillColor: Colors.white70,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    // setState(() {
                                    //   _login = value;
                                    // });
                                  },
                                ),
                                SizedBox(height: 30),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Пароль',
                                    filled: true,
                                    fillColor: Colors.white70,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  obscureText: true,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   _password = value;
                                    // });
                                  },
                                ),
                                SizedBox(height: 30),
                                FlatButton(
                                  padding: const EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text('Войти'),
                                  textColor: Colors.white,
                                  color: Color(0xFF3985CC),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Забыл пароль',
                            style: TextStyle(
                              color: Color(0xFF0157A5),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 1000,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                          SizedBox(height: 30),
                          FlatButton.icon(
                            padding: const EdgeInsets.all(10),
                            onPressed: () {},
                            icon: Icon(Icons.ac_unit),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Color(0xFF0157A5))),
                            label: Text(
                              'Войти через Digital ID',
                              style: TextStyle(color: Color(0xFF0157A5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Form(
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Имя',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Фамилия',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Отчество',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Электронный адрес',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Номер телефона',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Придумайте пароль',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    obscureText: false,
                                  ),
                                  SizedBox(height: 30),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Повторите пароль',
                                      filled: true,
                                      fillColor: Colors.white70,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    obscureText: false,
                                  ),
                                  SizedBox(height: 30),
                                  FlatButton(
                                    padding: const EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('Зарегистрироваться'),
                                    textColor: Colors.white,
                                    color: Color(0xFF3985CC),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
