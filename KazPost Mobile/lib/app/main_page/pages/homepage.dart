import 'package:flutter/material.dart';

import '../../quiz.dart';

homepage() {
  Future.delayed(Duration(seconds: 6), () {
    HomePage();
  });
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

textStyle() {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
}

titleStyle() {
  return TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
}

class _HomePageState extends State<HomePage> {
  @override
  String name = 'Чингиз';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizPage()));
                  },
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  color: Color(0xFFF7C977),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('Пройдите тест до 27 декабря!'),
                ),
                SizedBox(height: 30),
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Привет, ' + name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Здесь вы можете найти полезные курсы для себя',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                OutlineButton.icon(
                  padding: const EdgeInsets.all(8),
                  label: Expanded(
                    child: Text(
                      'Название курса',
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                      ),
                    ),
                  ),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0157A5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'ОБУЧЕНИЕ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 30),
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
                Container(
                  width: 1000,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'МАТЕРИАЛЫ',
                  style: titleStyle(),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFC57C62),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: 25,
                              width: 25,
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('Мониторинг'),
                                SizedBox(height: 10),
                                Image(
                                  image: AssetImage(
                                      './assets/img/progress_bar.png'),
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 120),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF0157A5),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      label: Text(''),
                    ),
                    SizedBox(height: 20),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFF7C977),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage('./assets/img/calculator.png'),
                              height: 25,
                              width: 25,
                            ),
                          ),
                          SizedBox(width: 50),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('Учет и Аудит'),
                                SizedBox(height: 10),
                                Image(
                                  image: AssetImage(
                                      './assets/img/progress_bar.png'),
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 120),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF0157A5),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      label: Text(''),
                    ),
                    SizedBox(height: 20),
                    FlatButton.icon(
                      padding: const EdgeInsets.all(0),
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFF004477),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage('./assets/img/call_phone.png'),
                              height: 25,
                              width: 25,
                            ),
                          ),
                          SizedBox(width: 37),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('Оператор связи'),
                                SizedBox(height: 10),
                                Image(
                                  image: AssetImage(
                                      './assets/img/progress_bar.png'),
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 110),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF0157A5),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      label: Text(''),
                    ),
                    SizedBox(height: 30),
                    OutlineButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () {},
                      textColor: Color(0xFF0157A5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Color(0xFF0157A5),
                        ),
                      ),
                      child: Text('Больше материалов..'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 10000) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "В разработке",
            ),
          )
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
