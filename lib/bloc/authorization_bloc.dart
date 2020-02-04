import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

String serverUrl = "http://188.225.9.250";

class DatabaseHelper {
  //contains errors message
  var status;

  //Response body of login
  var loginBody;

  var accessToken;
  var href;

  Future loginData(String email, String password) async {
    String myUrl = "$serverUrl/api/login";
    final response = await http
        .post(myUrl, body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');

    final data = json.decode(response.body);

    if (status) {
      print('ошибка : ${data["error"]}');
    } else {
      _saveToken(data["tokens"]["accessToken"]);
      _saveRefreshToken(data["tokens"]["refreshToken"]);
      _saveName(data["user"]["name"]);
      _saveId(data["user"]["_id"]);
      _saveType(data["user"]["type"]);
      _saveEmail(data["user"]["email"]);
      _saveAvatar(data["user"]["avatar"]);
      _savePosition(data["user"]["position"]);

      print('Авторизация пользователя произведена успешно');
    }
  }

  static Future refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final refreshToken = prefs.getString(key) ?? '';
    String myUrl = '$serverUrl/api/refresh';

    final response =
        await http.post(myUrl, body: {"refreshToken": "$refreshToken"});

    final status = response.body.contains('error');

    final data = json.decode(response.body);

    if (status) {
      print('Ошибка при обновлении токена');
    } else {
      await prefs.remove('accessToken');
      await prefs.remove('refreshToken');
      _saveToken(data["accessToken"]);
      _saveRefreshToken(data["refreshToken"]);
      print('Обновлен accessToken');
    }
  }

  Future sendReview(String title, String review) async {
    final prefs = await SharedPreferences.getInstance();
    final accessTokenKey = 'accessToken';
    final accessToken = prefs.getString(accessTokenKey) ?? '';

    final idKey = '_id';
    final id = prefs.getString(idKey) ?? '';

    String myUrl = "$serverUrl/api/feedback";

    final response = await http.post(myUrl, headers: {
      "Authorization": "$accessToken"
    }, body: {
      "title": "$title",
      "text": "$review",
      "author": "$id"
    });

    status = response.body.contains('Некорректный токен!');

    if (response.statusCode == 401) {
      print('Обновите токен');
      await DatabaseHelper.refreshToken();
    } else {
      print('Важе сообщение было отправлено');
    }
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
    prefs.remove("refreshToken");
    prefs.remove("name");
    prefs.remove("_id");
    prefs.remove("type");
    prefs.remove("email");
    prefs.remove("avatar");
    prefs.remove("position");
    debugPrint('Пользователь вышел с аккаунта');
  }

  static _saveToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = accessToken;
    prefs.setString(key, value);
  }

  static _saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final value = refreshToken;
    prefs.setString(key, value);
  }

  _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = name;
    prefs.setString(key, value);
  }

  _saveId(String _id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '_id';
    final value = _id;
    prefs.setString(key, value);
  }

  _saveType(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'type';
    final value = type;
    prefs.setString(key, value);
  }

  _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = email;
    prefs.setString(key, value);
  }

  _saveAvatar(String avatar) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = avatar;
    prefs.setString(key, value);
  }

  _savePosition(String position) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'position';
    final value = position;
    prefs.setString(key, value);
  }
}
