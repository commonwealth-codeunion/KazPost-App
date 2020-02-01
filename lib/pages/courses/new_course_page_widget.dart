import 'package:flutter/material.dart';

class NewCoursePageWidget extends StatelessWidget {
  const NewCoursePageWidget(this.borderColor);
  final int borderColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: CircleBorder(),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: Color(borderColor), width: 8),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF0157A5), Color(0xFF77B9F7)],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(1, 87, 165, 0.5),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.collections_bookmark,
            size: MediaQuery.of(context).size.height / 9,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
