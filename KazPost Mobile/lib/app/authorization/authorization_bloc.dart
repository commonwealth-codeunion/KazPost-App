import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

String serverUrl = "http://188.225.9.250";

class DatabaseHelper {
  DatabaseHelper({
    this.name,
    this.accessToken,
    this.href,
    this.loginBody,
    this.status,
  });

  // Files _files = Files();

  String name = '';

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
      getAvatar();

      debugPrint('Авторизация пользователя произведена успешно');
    }
  }

  static Future refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final refreshToken = prefs.getString(key) ?? '';
    if (refreshToken == '' || refreshToken == null) {
      print('просроченый токен');
    } else {
      print(refreshToken);
      String myUrl = '$serverUrl/api/refresh';
      final response =
          await http.post(myUrl, body: {"refreshToken": "$refreshToken"});
      final status = response.body.contains('error');

      var data = json.decode(response.body);

      print(data);

      if (status) {
        print('error');
        debugPrint('Произошла ошибка при обновлении accessToken');
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('accessToken');
        prefs.remove('refreshToken');
         _saveToken(data["accessToken"]);
        _saveRefreshToken(data["refreshToken"]);
        debugPrint('Обновлен accessToken');
      }
    }

    await Future.delayed(Duration(seconds: 3));
  }

  Future sendReview(String title, String review) async {
    final prefs = await SharedPreferences.getInstance();
    final accessTokenKey = 'accessToken';
    final accessToken = prefs.getString(accessTokenKey) ?? '';
    print('$accessToken');
    final idKey = '_id';
    final id = prefs.getString(idKey) ?? '';
    print(id);
    String myUrl = "$serverUrl/api/feedback";

    await http.post(myUrl,
        headers: {"Authorization": "$accessToken"},
        body: {"title": "$title", "text": "$review", "author": "$id"});

    debugPrint('Пожелание было отправлено');
  }

  getAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '_id';
    final id = prefs.get(key) ?? '';

    String myUrl = "$serverUrl/nginx/assets/images/avatars/$id.jpg";

    _saveAvatar(myUrl);
    debugPrint('Подгружена аватарка пользователя: $id');
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
    prefs.remove("name");
    prefs.remove("_id");
    prefs.remove("href");
    prefs.remove("type");
    prefs.remove("email");
    prefs.remove("avatar");
    prefs.remove("title");
    prefs.remove("description");
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
}

