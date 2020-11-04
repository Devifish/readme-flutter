import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReadBookState();
  }
}

class _ReadBookState extends State<ReadBook> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("阅读页面")),
    );
  }
}