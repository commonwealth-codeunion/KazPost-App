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

    final response = await http.post(myUrl, headers: {
      "Content-Type": "application/json",
      "Authorization": "$accessToken",
    });

    var data = response.body;
    quiz = json.decode(data);

    if (response.statusCode == 401) {
      print('Обновите токен');
      DatabaseHelper.refreshToken();
    } else {
      if (response.statusCode != 200) {
        print('Ошибка: ${response.statusCode}');
      } else {
        _saveNumberOfQuizzes(quiz["quizzes"].length);
        print('Тесты были успешно доставлены');
      }
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

  static Future sendReview(
      int score, int i, int rating, String callback) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final accessToken = prefs.getString(key) ?? '';
    final idKey = '_id';
    final _id = prefs.getString(idKey) ?? '';

    String myUrl = '$serverUrl/api/quiz/upload';

    var params = {
      "uid": '$_id',
      "qid": '${quiz["quizzes"][i]["_id"]}',
      "right": score,
      "review": {
        "rating": rating,
        "text": '$callback',
        "author": '$_id',
      },
    };

    final response = await http.post(
      myUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "$accessToken"
      },
      body: json.encode(params),
    );

    if (response.statusCode == 401) {
      print('Обновите токен');
      DatabaseHelper.refreshToken();
    } else {
      print('Ваш отзыв был отправлен');
    }
  }
}
