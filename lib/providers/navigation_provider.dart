import 'dart:async';

import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final PageController _pageController = PageController();
  Timer? _timer;

  PageController get pageController => _pageController;
  
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void startAutoScroll(List<Map<String, dynamic>> gridItems) {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.page == gridItems.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
