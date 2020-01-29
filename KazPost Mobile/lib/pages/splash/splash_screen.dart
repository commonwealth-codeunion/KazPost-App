import 'package:flutter/material.dart';
import 'package:kazpost/pages/authorization/authorization_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AuthPage(),
      image: new Image.asset("./assets/img/kazpost.png"),
      backgroundColor: Colors.white,
      photoSize: 100,
      loaderColor: Color(0xFF0157A5),
    );
  }
}