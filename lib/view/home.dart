import 'package:flutter/material.dart';
import 'package:readme/view/book/bookshelf.dart';
import 'package:readme/view/find/find_book.dart';
import 'package:readme/view/mine/me.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: "书架",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.language),
      label: "发现",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "我的",
    ),
  ];

  var _selectedIndex = 0;
  var _pageController = PageController();
  var _pages = [BookShelf(), FindBook(), Me()];

  @override
  void initState() {
    super.initState();
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
            itemBuilder: (context, index) => _pages[index],
            itemCount: _pages.length,
            controller: _pageController,
            onPageChanged: _onPageChanged),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          items: bottomItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => _pageController.jumpToPage(index),
        ));
  }
}
