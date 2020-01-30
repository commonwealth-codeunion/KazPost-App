import 'dart:convert';

// import 'package:kazpost/app/pages/homepage/files_model.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var collection;

class FilesModel {
  static Future getFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final accessToken = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/api/getFiles";

    http.Response response =
        await http.post(myUrl, headers: {"Authorization": "$accessToken"});

    if (response.statusCode == 401) {
      print("Обновите токен");
      DatabaseHelper.refreshToken();
    } else {
      String data = response.body;
      collection = json.decode(data);
      print('Файлы были успешно доставлены');
    }
  }

  static Future downloadFile() async {}
}

//   List<Files> _files =
//       collection.map((json) => Files.fromJson(json)).toList();
// }

// class Files {
//   final String title;
//   final String description;
//   final String href;

//   Files.fromJson(Map<String, dynamic> json)
//       : title = json["latestFiles"][0]['title'],
//         description = json['description'],
//         href = json['href'];
// }
