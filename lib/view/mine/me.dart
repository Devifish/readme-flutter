import 'package:flutter/material.dart';
import 'package:readme/common/theme.dart';

class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MeState();
  }
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.nearlyWhite,
        appBar: AppBar(title: Text("我的")),
        body: Center(
          child: Text('Hello World'),
        ));
  }
}
