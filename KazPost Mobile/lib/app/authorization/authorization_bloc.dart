import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  String serverUrl = "http://188.225.9.250";
  String name = '';
  var status;

  var accessToken;
  var href;

  loginData(String email, String password) async {
    String myUrl = "$serverUrl/api/login";
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
      _saveType(data["user"]["type"]);
      _saveEmail(data["user"]["email"]);
    }

    getAvatar();
  }

  sendReview(String title, String review) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.getString(key) ?? '';
    print('$value');
    final idKey = '_id';
    final idVal = prefs.getString(idKey) ?? '';
    print(idVal);
    String myUrl = "$serverUrl/api/feedback";

    final response = await http.post(myUrl,
        headers: {"Authorization": "$value"},
        body: {"title": "$title", "text": "$review", "author": "$idVal"});
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(data);
  }

  getAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final key = '_id';
    final value = prefs.get(key) ?? '';
    print(value);

    String myUrl = "$serverUrl/nginx/assets/images/avatars/$value.jpg";

    _saveAvatar(myUrl);
    print(myUrl);
  }

  getFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/api/getFiles";

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
    prefs.remove("name");
    prefs.remove("_id");
    prefs.remove("href");
    prefs.remove("type");
    prefs.remove("email");
    prefs.remove("avatar");
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

class QuizHelper {
  getQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.getString(key) ?? '';
    String myUrl = "http://188.225.9.250/api/quizzes";

    final response =
        await http.post(myUrl, headers: {"Authorization": "$value"});

    var data = json.decode(response.body);

    _saveTitle(data["quizzes"][0]["title"]);
    String description = data["quizzes"][0]["description"];
    _saveQuestion(data["quizzes"][0]["questions"]["0"]["question"]);
    bool answer = data["quizzes"][0]["questions"]["0"]["true"]["C"];
    print(description);
    print(answer);
  }

  clearQuiz() async  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("title");
    prefs.remove("remove"); 
  }

  _saveTitle(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'title';
    final value = title;
    prefs.setString(key, value);
  }

  _saveQuestion(String question) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'question';
    final value = question;
    prefs.setString(key, value);
  }
}
