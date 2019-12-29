import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://188.225.9.250:80/api";
  var status;

  var token;

  loginData(String email, String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http
        .post(myUrl, body: {"email": "$email", "password": "$password"});
    status = response.body.contains('message');

    var data = json.decode(response.body);

    print(data);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('token : ${data["tokens"]["accessToken"]}');
      print('refreshToken : ${data["tokens"]["refreshToken"]}');
      _saveToken(data["token"]);
      _saveRefresh(data["refreshToken"]);
    }
  }

  getRefreshToken(String refreshToken) async {
    String myUrl = "$serverUrl/refresh";
    final response =
        await http.post(myUrl, body: {"refreshToken": "$refreshToken"});
    status = response.body.contains('message');

    var data = json.decode(response.body);

    print(data);

    if (status) {
      print('error: ${data["error"]}');
    } else {
      print('new token : ${data["tokens"]["accessToken"]}');
      print('new refreshToken : ${data["tokens"]["refreshToken"]}');
      _saveToken(data["token"]);
      _saveRefresh(data["refreshToken"]);
    }
  }

  _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  _saveRefresh(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final value = token;
    prefs.setString(key, value);
  }

  readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  readRefresh() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final value = prefs.get(key) ?? 0;
    print('read: $value');
  }
}
