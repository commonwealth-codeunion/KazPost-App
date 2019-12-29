import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';
import 'package:kazpost/app/pages/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? null;
    if (value != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    readToken();
    // getRefreshToken();
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .loginData(_emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            CircularProgressIndicator();
          } else {
            Navigator.pushReplacementNamed(context, '/mainpage');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              margin: const EdgeInsets.all(80.0),
              child: Image(
                image: AssetImage('./assets/img/kazpost.png'),
              ),
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
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Пожалуйста введите логин';
                                  }
                                  return null;
                                },
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
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Пожалуйста введите пароль';
                                  }
                                  return null;
                                },
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
                                onPressed: () {
                                  _onPressed();
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Text(
                            '$msgStatus',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Забыли пароль',
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
                          icon: Image(
                            image: AssetImage('./assets/img/digital_id.png'),
                            height: 30,
                          ),
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
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Ошибка индентификации'),
            content: new Text('Проверьте корректность емайла и пароля.'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Закрыть',
                ),
                color: Color(0xFF0157A5),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
