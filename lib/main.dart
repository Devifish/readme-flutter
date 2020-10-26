import 'package:flutter/material.dart';
import 'package:readme/common/constant.dart';
import 'package:readme/view/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstant.title,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: ApplicationConstant.title),
    );
  }
}
