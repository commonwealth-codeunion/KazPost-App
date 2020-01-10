import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class Certificates extends StatefulWidget {
  Certificates({Key key}) : super(key: key);

  @override
  CertificatesState createState() => CertificatesState();
}

class CertificatesState extends State<Certificates> {
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Достижения',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: wp(10),
                      height: hp(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFC57C62)),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
