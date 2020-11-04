import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReadBookState();
  }
}

class _ReadBookState extends State<ReadBook> {
  bool _showTopWidget = false;
  List<BottomNavigationBarItem> _bottomItems;

  @override
  void initState() {
    super.initState();

    _bottomItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: "目录",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "设置",
      )
    ];
  }

  void _changeShowTopWidget() {
    setState(() {
      _showTopWidget = !_showTopWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: ScreenUtil.getScreenW(context),
          height: ScreenUtil.getScreenH(context),
          color: Colors.grey,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _changeShowTopWidget,
            child: Text(
              "书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍容书籍内容书籍内容书籍内容书籍内容书籍内容书籍内容书籍内容",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Offstage(
          offstage: !_showTopWidget,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(title: Text("阅读页面"), actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [],
                )
              ]),
              body: GestureDetector(onTap: _changeShowTopWidget),
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.black,
                items: _bottomItems,
                type: BottomNavigationBarType.fixed,
              )),
        )
      ],
    );
  }
}
