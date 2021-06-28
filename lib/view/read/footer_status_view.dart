import 'package:flutter/cupertino.dart';
import 'package:readme/common/constant.dart';

/// 底部状态栏
class FooterStatusView extends StatelessWidget {
  final String chapterName;
  final int currentPage;
  final int totalPage;

  const FooterStatusView({
    Key? key,
    required this.chapterName,
    required this.currentPage,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ReadPageConstant.INFO_CONTAINER_HEIGHT,
      child: Text(
        "$currentPage/$totalPage",
        style: TextStyle(
          fontSize: ReadPageConstant.INFO_CONTAINER_FONT_SIZE,
        ),
      ),
    );
  }
}
