import 'package:flutter/material.dart';
import 'package:readme/model/home.dart';
import 'package:readme/view/book/bookshelf.dart';
import 'package:readme/view/find/find_book.dart';
import 'package:readme/view/mine/me.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<BottomItem> bottomItems = [
    BottomItem(label: "书架", icon: Icons.book),
    BottomItem(label: "发现", icon: Icons.language),
    BottomItem(label: "我的", icon: Icons.person)
  ];

  late PageController _pageController;
  late List<Widget> _pages;

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pages = [BookShelf(), FindBook(), Me()];
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _pages[index],
          itemCount: _pages.length,
          controller: _pageController,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          items: bottomItems
              .map((item) => BottomNavigationBarItem(
                  label: item.label, icon: Icon(item.icon)))
              .toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => _pageController.jumpToPage(index),
        ));
  }
}
