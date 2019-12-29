import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:kazpost/app/pages/courses/course_bookmark.dart';

class WorksPage extends StatefulWidget {
  WorksPage({Key key}) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Закладки",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        titleSpacing: -3,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(5.5),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: hp(32),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.675,
                    ),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      CourseWidget(),
                      CourseWidget(),
                      CourseWidget(),
                      CourseWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
