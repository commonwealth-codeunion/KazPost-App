import 'dart:async';

import 'package:kazpost/models/files_model.dart';


class FilesManager {
  Stream<List> get filesList async* {
    yield await FilesModel.getFiles();
  }
}
