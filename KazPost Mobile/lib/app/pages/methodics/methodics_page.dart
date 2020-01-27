import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:kazpost/app/authorization/authorization_bloc.dart';

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
  // Files _files = Files();

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Идеально"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: null // '${files[i]["href"]}',
        );
  }
}
