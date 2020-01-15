import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final String img;
  final String label;
  final int fontColor;
  const SettingsWidget(this.img, this.label, this.fontColor);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {},
      leading: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF0157A5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          img,
          height: 25,
          width: 25,
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 17,
          color: Color(fontColor),
        ),
      ),
    );
  }
}
