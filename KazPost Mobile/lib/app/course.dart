import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        icon: Image(
            image: AssetImage('./assets/img/first_card.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
