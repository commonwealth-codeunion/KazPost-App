import 'dart:async';

import 'package:kazpost/app/pages/homepage/files_bloc.dart';
import 'package:kazpost/app/pages/homepage/files_model.dart';

class FilesManager {
  Stream<List> get filesList async* {
    yield await FilesModel.getFiles();
  }
}
