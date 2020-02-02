import 'package:flutter/material.dart';
import 'package:kazpost/pages/courses/course_bookmark.dart';

class WorksPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Закладки',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
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
