import 'package:flutter/cupertino.dart';

class PageViewProvider extends ChangeNotifier {
  final PageController _pageController =
      PageController(keepPage: true, initialPage: 2);
  PageController get getNavbarPageController => _pageController;

  void changePage(int index) {
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
    notifyListeners();
  }
}
