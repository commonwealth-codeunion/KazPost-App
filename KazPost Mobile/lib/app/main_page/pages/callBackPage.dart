import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class CallBackPage extends StatefulWidget {
  CallBackPage({Key key}) : super(key: key);

  @override
  _CallBackPageState createState() => _CallBackPageState();
}

class _CallBackPageState extends State<CallBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(
              'Есть пожелания?\nОтправьте нам письмо.',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
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
            SizedBox(height: 30),
            MultiSelectFormField(
              titleText: 'Выберите смайлик',
              dataSource: [
                {
                  "display": "Отлично 😀",
                  "value": "Perfect",
                },
                {
                  "display": "Разнесу ща все😡",
                  "value": "Bad",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            SizedBox(height: 30),
            RaisedButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {},
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
    );
  }
}
