import 'package:flutter/material.dart';
import 'package:readme/common/constant.dart';

/// 滑动翻页阅读视图
/// 用于左右滑动翻页方式进行阅读
class FlipReadView extends StatefulWidget {
  final double height;
  final String content;
  final VoidCallback onLoadNext;
  final VoidCallback onLoadLase;
  final ReadController controller;

  FlipReadView(
      {this.height,
      this.content,
      this.controller,
      this.onLoadNext,
      this.onLoadLase});

  @override
  _FlipReadViewState createState() => _FlipReadViewState();
}

class _FlipReadViewState extends State<FlipReadView> {
  final PageController _controller = PageController(initialPage: 0);

  int _pageCount = 5;
  int _lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    final contentHeight =
        widget.height - ReadPageConstant.INFO_CONTAINER_HEIGHT;
    double contentFontSize = 18;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0 && notification is ScrollEndNotification) {
          var metrics = notification.metrics as PageMetrics;
          var currentIndex = metrics.page;
          _lastIndex = currentIndex.toInt();

          // 防止重复调用
          if (_lastIndex != currentIndex) return false;

          if (currentIndex + 1 == _pageCount) {
            print(currentIndex);

            _controller.jumpToPage(0);
          }else if (currentIndex == 0) {
            _controller.jumpToPage(_pageCount - 1);
          }
        }
        return false;
      },
      child: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _pageCount,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                height: contentHeight,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                child: Text(
                  widget.content,
                  style: TextStyle(fontSize: contentFontSize),
                ),
              ),
              Container(
                height: ReadPageConstant.INFO_CONTAINER_HEIGHT,
                child: Text(
                  "${index + 1}/$_pageCount",
                  style: TextStyle(
                      fontSize: ReadPageConstant.INFO_CONTAINER_FONT_SIZE),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}

class ReadController extends ChangeNotifier {
  void next() {}

  void prev() {}
}
