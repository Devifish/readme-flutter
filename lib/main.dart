import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readme/common/constant.dart';
import 'package:readme/view/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var systemUiStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

    // 设置SystemUi样式
    SystemChrome.setSystemUIOverlayStyle(systemUiStyle);
    return MaterialApp(
      title: ApplicationConstant.title,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.iOS
      ),
      home: Home(title: ApplicationConstant.title),
      debugShowCheckedModeBanner: false
    );
  }
}
