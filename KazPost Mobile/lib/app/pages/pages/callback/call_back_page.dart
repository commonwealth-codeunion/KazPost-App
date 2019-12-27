import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class CallBackPage extends StatefulWidget {
  CallBackPage({Key key}) : super(key: key);

  @override
  _CallBackPageState createState() => _CallBackPageState();
}

class _CallBackPageState extends State<CallBackPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(4),
          vertical: hp(1),
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
            SizedBox(
              height: hp(2),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: wp(2),
                  vertical: hp(10),
                ),
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
            SizedBox(
              height: hp(2),
            ),
            MultiSelectFormField(
              autovalidate: false,
              titleText: 'Выберите смайлик', 
              dataSource: [
                {
                  "display": "Отлично 😀",
                  "value": "1",
                },
                {
                  "display": "Разнесу ща все😡",
                  "value": "0",
                },
              ],
              textField: 'display',
              valueField: 'value',
              hintText: 'Выбрать...',
            ),
            SizedBox(
              height: hp(2),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(
                vertical: hp(2),
              ),
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
