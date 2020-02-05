import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/models/files_model.dart';

class MethodicsPage extends StatefulWidget {
  final String fileId;

  MethodicsPage({Key key, @required this.fileId}) : super(key: key);

  @override
  _MethodicsPageState createState() => new _MethodicsPageState(this.fileId);
}

class _MethodicsPageState extends State<MethodicsPage> {
  String fileId;
  _MethodicsPageState(this.fileId);
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("$fileId"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      path: '/sdcard/Download/$fileId',
    );
  }
}
