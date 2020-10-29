import 'package:flutter/material.dart';
import 'package:readme/common/theme.dart';

class BookShelf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BookShelfState();
  }
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.nearlyWhite,
        appBar: AppBar(title: Text('书架')));
  }
}
