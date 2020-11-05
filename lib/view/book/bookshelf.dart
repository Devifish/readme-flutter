import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readme/common/event.dart';
import 'package:readme/common/theme.dart';
import 'package:readme/view/book/book_detail.dart';
import 'package:readme/view/read/read_book.dart';

class BookShelf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();

    // 注册事件总线监听
    eventBus.on<BookshelfUpdateEvent>().listen((event) {
      log("监听到书架发生变化, 开始更新书架数据");
    });
  }

  void _toReadBook() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReadBook();
    }));
  }

  void _toBookDetail(int bookshelfId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BookDetail();
    }));
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
                child: _BookListItem(key: Key(index.toString())),
                onTap: () {
                  _toReadBook();
                },
                onLongPress: () {
                  _toBookDetail(index);
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

/// 书籍列表Item
/// 用于批量构建书籍列表 Item 组件
class _BookListItem extends StatelessWidget {
  final Key key;

  _BookListItem({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 128,
                width: 96,
                padding: const EdgeInsets.only(left: 8, top: 8),
                color: Colors.grey,
                child: Stack(
                  children: [],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, top: 8.0),
                child: Text(
                  "书名",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 8.0),
                child: Text(
                  "作者",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 12.0),
                child: Text(
                  "章节数据",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 8.0),
                child: Text("阅读数据",
                    style: TextStyle(color: Colors.grey, fontSize: 11)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
