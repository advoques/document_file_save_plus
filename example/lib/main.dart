import 'dart:typed_data';

import 'package:document_file_save_plus/document_file_save.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    List<int> htmlBytes = utf8.encode("<h1>Header 1</h1><p>This is sample text</p>");
    List<int> textBytes = utf8.encode("Some data");
    Uint8List htmlBytes1 = Uint8List.fromList(htmlBytes);
    Uint8List textBytes1 = Uint8List.fromList(textBytes);

    // save multiple files
    DocumentFileSave.saveMultipleFiles([htmlBytes1, textBytes1], ["htmlfile.html", "textfile.txt"], ["text/html", "text/plain"]);

    // save multiple files (case that file have same name). system will automatically append number to filename.
    //DocumentFileSave.saveMultipleFiles([htmlBytes, textBytes], ["file.txt", "file.txt"], ["text/html", "text/plain"]);

    // save single file
    // DocumentFileSave.saveFile(htmlBytes, "my test html file.html", "text/html");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('document_file_save Plugin'),
        ),
        body: Center(
          child: Text('Please check file in Download folder (or Files App in iOS)'),
        ),
      ),
    );
  }

}
