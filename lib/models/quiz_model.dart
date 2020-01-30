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
    if (accessToken == null || accessToken == '') {
      DatabaseHelper.refreshToken();
    } else {
      String myUrl = "$serverUrl/api/quizzes";

      final response =
          await http.post(myUrl, headers: {"Authorization": "$accessToken"});

      var data = response.body;
      quiz = json.decode(data);

      if (response.statusCode != 200) {
        print('Error');
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

    if (accessToken == null || accessToken == '') {
      DatabaseHelper.refreshToken();
    } else {

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
      print(json.encode(params));
      final response = await http.post(
        myUrl,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "$accessToken"
        },
        body: json.encode(params),
      );

      var data = json.decode(response.body);
      print('$data');
    }
  }
}
