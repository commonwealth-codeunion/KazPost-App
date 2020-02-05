import 'dart:async';

import 'package:kazpost/models/files_model.dart';

FilesModel filesModel = FilesModel();

class FilesManager {
  Stream<List> get filesList async* {
    yield await filesModel.getFiles();
  }
}
