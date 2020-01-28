import 'dart:convert';

import 'package:kazpost/app/authorization/authorization_bloc.dart';
// import 'package:kazpost/app/pages/homepage/files_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var collection;

class FilesModel {
  static Future getFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final accessToken = prefs.get(key) ?? 0;
    if (accessToken == '' || accessToken == null) {
      DatabaseHelper.refreshToken();
    } else {
      String myUrl = "$serverUrl/api/getFiles";

      http.Response response =
          await http.post(myUrl, headers: {"Authorization": "$accessToken"});

      String data = response.body;
      collection = json.decode(data);
    }
  }
  //   List<Files> _files =
  //       collection.map((json) => Files.fromJson(json)).toList();
  // }
}

// class Files {
//   final String title;
//   final String description;
//   final String href;

//   Files.fromJson(Map<String, dynamic> json)
//       : title = json["latestFiles"][0]['title'],
//         description = json['description'],
//         href = json['href'];
// }
