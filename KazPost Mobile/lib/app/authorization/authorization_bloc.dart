import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://188.225.9.250/api";
  var status;

  var accessToken;
  var _id;
  var href;

  loginData(String email, String password) async {
    String myUrl = "$serverUrl/login";
    final response = await http
        .post(myUrl, body: {"email": "$email", "password": "$password"});
    status = response.body.contains('error');

    final data = json.decode(response.body);

    print(data);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('token : ${data["tokens"]["accessToken"]}');
      print('id : ${data["user"]["_id"]}');
      _saveToken(data["tokens"]["accessToken"]);
      _saveName(data["user"]["name"]);
      _saveId(data["user"]["_id"]);
    }
  }

  void sendReview(String title, String review) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.get(key) ?? 0;
    print('$value');
    final idKey = '_id';
    final idVal = prefs.get(idKey) ?? 0;
    print(idVal);
    String myUrl = "$serverUrl/feedback";

    final response = await http.post(myUrl,
        headers: {"Authorization": "$value"},
        body: {"title": "$title", "text": "$review", "author": "$idVal"});
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(data);
  }

  getFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/getFiles";

    final response =
        await http.post(myUrl, headers: {"Authorization": "$value"});
    status = response.body.contains('error');

    var data = json.decode(response.body);

    print(data);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print(data.latestFiles[0]["href"]);
      _saveHref(data.latestFiles[0]["href"]);
    }
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
    prefs.remove("_id");
    print(accessToken);
    print(_id);
  }

  _saveToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = accessToken;
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

  _saveHref(String href) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'href';
    final value = href;
    prefs.setString(key, value);
  }

  readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  readName() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  readId() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '_id';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

  readHref() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'href';
    final value = prefs.get(key) ?? 0;
    print('read: $value');
  }
}
