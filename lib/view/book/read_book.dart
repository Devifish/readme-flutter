import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ReadBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReadBookState();
  }
}

class _ReadBookState extends State<ReadBook> {
  bool _showReadTopMenu = false;
  List<BottomNavigationBarItem> _bottomItems;
  String _content;

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
    _content =
        "书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容书籍内容书\r\n籍内容书籍内容书籍内容书籍内\r\n容书籍内容书籍内容书籍内容书籍\r\n容书籍内容书籍内容书籍内容书\r\n籍容书籍内容书籍内容书籍内容书籍容书籍内容书书籍内容书籍内容书籍内容";
  }

  void _changeShowTopWidget() {
    setState(() {
      _showReadTopMenu = !_showReadTopMenu;
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
            child: _flipReadWidget(),
          ),
        ),
        Offstage(offstage: !_showReadTopMenu, child: _readTopMenu())
      ],
    );
  }

  /// 阅读页面顶层菜单
  ///
  Widget _readTopMenu() {
    return Scaffold(
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
        ));
  }

  Widget _flipReadWidget() {
    int fontSize = 16;
    double screenHeight = ScreenUtil.getScreenH(context);

    return PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Text(
            _content,
            style: TextStyle(fontSize: fontSize.toDouble()),
          );
        },
        itemCount: 5);
  }

  Widget _scrollReadWidget() {}
}
