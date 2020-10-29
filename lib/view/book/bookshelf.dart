import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readme/common/theme.dart';

class BookShelf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BookShelfState();
  }
}

class _BookShelfState extends State<BookShelf> {
  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();

    super.initState();
  }

  /// 书籍列表Item
  /// 用于批量构建书籍列表 Item 组件
  Widget bookListItem(int index) {
    return ListTile(
      title: Text("书籍$index"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      appBar: AppBar(
        title: Text("书架"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [],
          )
        ],
      ),
      body: SmartRefresher(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: bookListItem(index),
                onTap: () {
                  log("点击了 $index");
                },
              );
            },
            itemCount: 50),
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () => {},
      ),
    );
  }
}
