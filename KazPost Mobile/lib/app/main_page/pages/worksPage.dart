import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  WorksPage({Key key}) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.only(bottom: 17),
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
                  margin: const EdgeInsets.only(top: 17),
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
                  height: 350,
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.8,
                    ),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            height: 350,
                            fit: BoxFit.cover),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            height: 350,
                            fit: BoxFit.cover),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            height: 350,
                            fit: BoxFit.cover),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage('./assets/img/first_card.png'),
                            height: 350,
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
