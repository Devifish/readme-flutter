import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readme/common/constant.dart';
import 'package:readme/widget/text_composition.dart';

import 'first_chapter.dart';
import 'footer_status_view.dart';

/// 滚动阅读视图
/// 用于上下滚动翻页方式进行阅读
class ScrollReadView extends StatefulWidget {
  final double height;

  ScrollReadView({required this.height});

  @override
  State<StatefulWidget> createState() {
    return _ScrollReadViewState();
  }
}

class _ScrollReadViewState extends State<ScrollReadView> {
  late RefreshController _refreshController;
  late TextComposition _textComposition;

  var size = TextEditingController(text: '18'),
      height = TextEditingController(text: '1.5'),
      paragraph = TextEditingController(text: '10'),
      currentPage = 0;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController();
    _textComposition = TextComposition(
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

    return Column(
      children: [
        Container(
          height: contentHeight,
          child: SmartRefresher(
            child: ListView.builder(
              itemBuilder: (context, index) {
                currentPage = index;
                return Container(
                  height: contentHeight,
                  child: _textComposition.getPageWidget(index),
                );
              },
              itemCount: _textComposition.pageCount,
            ),
            controller: _refreshController,
          ),
        ),
        FooterStatusView(
          chapterName: "",
          currentPage: currentPage + 1,
          totalPage: _textComposition.pageCount,
        ),
      ],
    );
  }
}
