import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildError(BuildContext context, FlutterErrorDetails error) {
  return Text(
    'Произошла ошибка. Пожалуйста обновите страницу.',
    style: TextStyle(
      color: Colors.red,
      fontSize: 20,
    ),
  );
}
