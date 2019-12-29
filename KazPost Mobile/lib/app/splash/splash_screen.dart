// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key key}) : super(key: key);

//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     countDownTime();
//   }

//   final int splashDuration = 2;

//   countDownTime() async {
//     return Timer(
//       Duration(seconds: splashDuration), () {
//         SystemChannels.textInput.invokeMethod(
//           'TextInput.hide'
//         );
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }
// }