import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:readme/common/constant.dart';

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
    final screenHeight = ScreenUtil.getScreenH(context);
    final statusBarHeight = ScreenUtil.getStatusBarH(context);
    final contentHeight = screenHeight - statusBarHeight;

    return Stack(
      children: [
        Material(
            color: Colors.grey,
            child: Container(
                padding: EdgeInsets.only(top: statusBarHeight),
                child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _changeShowTopWidget,
                    child: _flipReadWidget(contentHeight)))),
        Offstage(
            offstage: !_showReadTopMenu,
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
                )))
      ],
    );
  }

  /// 滑动翻页阅读控件
  /// 用于左右滑动翻页方式进行阅读
  Widget _flipReadWidget(double height) {
    int fontSize = 16;
    double contentHeight = height - ReadPageConstant.INFO_CONTAINER_HEIGHT;

    return PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: contentHeight,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                child: Text(_content, style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: ReadPageConstant.INFO_CONTAINER_HEIGHT,
                child: Text("1/5",
                    style: TextStyle(
                        fontSize: ReadPageConstant.INFO_CONTAINER_FONT_SIZE)),
              )
            ],
          );
        },
        itemCount: 5);
  }

  Widget _scrollReadWidget() {}
}
