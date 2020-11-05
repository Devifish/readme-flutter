import 'package:flutter/material.dart';
import 'package:readme/common/constant.dart';

/// 滑动翻页阅读视图
/// 用于左右滑动翻页方式进行阅读
class FlipReadView extends StatefulWidget {
  final double height;
  final String content;
  final PageController controller;

  FlipReadView({this.height, this.content})
      : controller = PageController(initialPage: 4);

  @override
  _FlipReadViewState createState() => _FlipReadViewState();
}

class _FlipReadViewState extends State<FlipReadView> {
  int _pageCount = 5;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    final contentHeight =
        widget.height - ReadPageConstant.INFO_CONTAINER_HEIGHT;
    double contentFontSize = 18;

    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: widget.controller,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: contentHeight,
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              child: Text(widget.content,
                  style: TextStyle(fontSize: contentFontSize)),
            ),
            Container(
              height: ReadPageConstant.INFO_CONTAINER_HEIGHT,
              child: Text(
                "${index + 1}/5",
                style: TextStyle(
                    fontSize: ReadPageConstant.INFO_CONTAINER_FONT_SIZE),
              ),
            ),
          ],
        );
      },
      reverse: reverse,
      onPageChanged: _onPageChanged,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      if (index + 1 == _pageCount) {
        //reverse = !reverse;
      } else if (index == 0) {
        //reverse = !reverse;
      }
    });
  }
}
