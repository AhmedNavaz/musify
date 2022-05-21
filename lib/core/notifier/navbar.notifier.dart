import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NavBarNotifier extends ChangeNotifier {
  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  List<Widget> bottomNavBarScreens = const <Widget>[];

  void updatePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
