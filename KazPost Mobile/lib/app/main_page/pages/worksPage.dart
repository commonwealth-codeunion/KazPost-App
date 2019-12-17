import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:kazpost/app/course.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: hp(1),
          horizontal: wp(3),
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
                Divider(
                  thickness: 2,
                  color: Color(0xFFC0C0C0),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Курсы',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: hp(40),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.75,
                    ),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            fit: BoxFit.cover),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            fit: BoxFit.cover),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            fit: BoxFit.cover),
                      ),
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
