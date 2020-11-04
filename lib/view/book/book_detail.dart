import 'package:flutter/material.dart';
import 'package:readme/view/book/read_book.dart';

class BookDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BookDetailState();
  }
}

class _BookDetailState extends State<BookDetail> {
  List<BottomNavigationBarItem> _bottomItems;

  @override
  void initState() {
    super.initState();

    _bottomItems = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chrome_reader_mode_outlined,
        ),
        label: '立即阅读',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.clear,
        ),
        label: '移除书架',
      ),
    ];
  }

  void _toReadBook() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReadBook();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("书籍详情")),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomItems,
          onTap: (index) {
            switch (index) {
              case 0: {
                _toReadBook();
                break;
              }
              case 1: {
                break;
              }
            }
          }),
    );
  }
}
