import 'dart:convert';
import 'dart:io';

// import 'package:kazpost/app/pages/homepage/files_model.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

var collection;

class FilesModel {
  String _fileId;

   Future getFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final accessToken = prefs.get(key) ?? 0;
    String myUrl = "$serverUrl/api/getFiles";

    http.Response response = await http.post(myUrl, headers: {
      "Content-Type": "application/json",
      "Authorization": "$accessToken",
    });

    String data = response.body;
    collection = json.decode(data);

    if (response.statusCode == 401) {
      print("Обновите токен");
      DatabaseHelper.refreshToken();
    } else {
      print('Файлы были успешно доставлены');
    }
  }

  Future downloadFile() async {
    var documentDirectory = await getApplicationDocumentsDirectory();

    var firstPath = documentDirectory.path + "/kazpost/pdf";
    await Directory(firstPath).create(recursive: true);

    var filePathAndName = documentDirectory.path +
        "kazpost/pdf" +
        'pdf-' +
        _fileId.trim() +
        '.pdf';
    File kazpostPdf = new File(filePathAndName);

    if (!await kazpostPdf.exists()) {
      kazpostPdf.writeAsBytes(collection.bodyBytes);
    }

    return kazpostPdf;
  }
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
