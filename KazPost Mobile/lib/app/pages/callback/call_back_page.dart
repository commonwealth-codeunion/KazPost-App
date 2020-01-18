import 'package:flutter/material.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';

class CallBackPage extends StatefulWidget {
  CallBackPage({Key key}) : super(key: key);

  @override
  _CallBackPageState createState() => _CallBackPageState();
}

class _CallBackPageState extends State<CallBackPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _reviewController = new TextEditingController();

  String msgStatus = '';

  _onPressed() {
    databaseHelper.sendReview(
        '${_titleController.text}', '${_reviewController.text}');
    _showDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              'Есть пожелания?\nОтправьте нам письмо.',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Тема обращения...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFF0157A5),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFF0157A5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    maxLines: 5,
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: 'Ваше сообщение...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFF0157A5),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFF0157A5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.5),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    onPressed: () {
                      _onPressed();
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('Отправить письмо'),
                    color: Color(0xFF0157A5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Успешно'),
          content: new Text(
              'Мы рассмотрим ваше сообщение в течении ближайшего времени.'),
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
      },
    );
  }
}
