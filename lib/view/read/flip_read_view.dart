import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:readme/common/constant.dart';
import 'package:readme/view/read/footer_status_view.dart';
import 'package:readme/widget/text_composition.dart';

import 'first_chapter.dart';

/// 滑动翻页阅读视图
/// 用于左右滑动翻页方式进行阅读
class FlipReadView extends StatefulWidget {
  final double height;
  final String content;
  final VoidCallback? onLoadNext;
  final VoidCallback? onLoadLase;
  final ReadController? controller;

  FlipReadView({
    this.height = 0,
    this.content = "",
    this.controller,
    this.onLoadNext,
    this.onLoadLase,
  });

  @override
  _FlipReadViewState createState() => _FlipReadViewState();
}

class _FlipReadViewState extends State<FlipReadView> {
  final PageController _controller = PageController(initialPage: 0);
  final initialPage = 0x7FFFFFFF;
  late TextComposition textComposition;

  var size = TextEditingController(text: '18'),
      height = TextEditingController(text: '1.5'),
      paragraph = TextEditingController(text: '10'),
      _lastIndex = 0;

  get _pageCount => textComposition.pageCount;

  @override
  void initState() {
    super.initState();

    textComposition = TextComposition(
      title: "Tset",
      text: first_chapter,
      style: TextStyle(
        color: Colors.black87,
        fontSize: double.tryParse(size.text),
        height: double.tryParse(height.text),
      ),
      padding: EdgeInsets.all(8),
      shouldJustifyHeight: true,
      debug: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final contentHeight =
        widget.height - ReadPageConstant.INFO_CONTAINER_HEIGHT;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0 && notification is ScrollEndNotification) {
          var metrics = notification.metrics as PageMetrics;
          var currentIndex = metrics.page;
          _lastIndex = currentIndex!.toInt();

          // 防止重复调用
          if (_lastIndex != currentIndex) return false;

          if (currentIndex + 1 == _pageCount) {
            print(currentIndex);

            _controller.jumpToPage(0);
          } else if (currentIndex == 0) {
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
                child: textComposition.getPageWidget(index),
              ),
              FooterStatusView(
                chapterName: "",
                currentPage: index + 1,
                totalPage: _pageCount,
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
