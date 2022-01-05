import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int _selectedNavbarIndex = 0;
  final PageController _pageController =
      PageController(keepPage: true, initialPage: 0);
  final ScrollController _scrollController = ScrollController();

  int get getNavbarIndex => _selectedNavbarIndex;
  PageController get getNavbarPageController => _pageController;
  ScrollController get getScrollController => _scrollController;

  void bottomNavBarTapped(int index) {
    _selectedNavbarIndex = index;
    _pageController.jumpToPage(_selectedNavbarIndex);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    // _pageController.dispose();
  }
}
