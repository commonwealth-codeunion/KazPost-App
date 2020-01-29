import 'dart:convert';

import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../pages/quiz/quiz_page.dart';

var quiz;

class QuizModel {
  DatabaseHelper databaseHelper = DatabaseHelper();

  static Future getQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final accessToken = prefs.getString(key) ?? '';

    String myUrl = "$serverUrl/api/quizzes";

    final response =
        await http.post(myUrl, headers: {"Authorization": "$accessToken"});

    var data = response.body;
    quiz = json.decode(data);

    if (response.statusCode != 200) {
      DatabaseHelper.refreshToken();
    } else {
      _saveNumberOfQuizzes(quiz["quizzes"].length);
      print('Тесты были успешно доставлены');
    }
  }

  static Future _saveNumberOfQuizzes(int numberOfQuizzes) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'numberOfQuizzes';
    final value = numberOfQuizzes;
    prefs.setInt(key, value);
  }

  Future updateQuestion() async {
    return questionNumber++;
  }
}
