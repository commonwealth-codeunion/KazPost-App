import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:kazpost/bloc/authorization_bloc.dart';
import 'package:kazpost/models/files_model.dart';

class MethodicsPage extends StatefulWidget {
  final int i;

  MethodicsPage({Key key, @required this.i}) : super(key: key);

  @override
  _MethodicsPageState createState() => new _MethodicsPageState(this.i);
}

class _MethodicsPageState extends State<MethodicsPage> {
  int i;
  _MethodicsPageState(this.i);
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Идеально"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
      path:
          '/storage/emulated/0/Download/${collection["latestFiles"][i]["_id"]}', //'${collection["latestFiles"][i]["href"]}',
    );
  }
}
