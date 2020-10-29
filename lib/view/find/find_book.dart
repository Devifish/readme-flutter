import 'package:flutter/material.dart';
import 'package:readme/common/theme.dart';

class FindBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FindBookState();
  }
}

class _FindBookState extends State<FindBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.nearlyWhite,
        appBar: AppBar(title: Text('发现')));
  }
}
