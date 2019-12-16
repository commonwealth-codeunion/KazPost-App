import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

final String email = './assets/img/email.svg';
final String call = './assets/img/call.svg';
final String help = './assets/img/help.svg';
final String lang = './assets/img/language.svg';
final String lock = './assets/img/lock.svg';
final String pad = './assets/img/pad.svg';

final Widget emailSvg = SvgPicture.asset(
  email,
  width: 25,
  height: 25,
);
final Widget callSvg = SvgPicture.asset(
  call,
  width: 25,
  height: 25,
);
final Widget helpSvg = SvgPicture.asset(
  help,
  width: 25,
  height: 25,
);
final Widget langSvg = SvgPicture.asset(
  lang,
  width: 25,
  height: 25,
);
final Widget lockSvg = SvgPicture.asset(
  lock,
  color: Colors.white,
  width: 25,
  height: 25,
);
final Widget padSvg = SvgPicture.asset(
  pad,
  width: 25,
  height: 25,
);

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(4),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Настройки',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: hp(1),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Divider(
                    thickness: 2,
                    color: Color(0xFFC0C0C0),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(2.5),
                          horizontal: wp(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFC57C62),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: emailSvg,
                      ),
                      label: Text(
                        "Электронный адрес",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
                      ),
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: hp(2.5),
                            horizontal: wp(5),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF7C977),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: callSvg),
                      label: Text(
                        "Телефонный номер",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
                      ),
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(2.5),
                          horizontal: wp(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF004477),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: padSvg,
                      ),
                      label: Text(
                        "Изменить пароль",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
                      ),
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(2.5),
                          horizontal: wp(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF7E89FD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: lockSvg,
                      ),
                      label: Text(
                        "Приватность",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
                      ),
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(2.5),
                          horizontal: wp(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFC57C62),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: langSvg,
                      ),
                      label: Text(
                        "Язык",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
                      ),
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: hp(2.5),
                          horizontal: wp(5),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7C977),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: helpSvg,
                      ),
                      label: Text(
                        "Поддержка",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: hp(1),
                      ),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xFFe3e3e3),
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
