import 'package:flutter/material.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:musify/meta/views/bottom_navigation/add/body.dart';
import 'package:musify/meta/views/bottom_navigation/liked/body.dart';
import 'package:musify/meta/views/bottom_navigation/listen_later/body.dart';
import 'package:musify/meta/views/bottom_navigation/search/body.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBody extends StatefulWidget {
  const NavBody({Key? key}) : super(key: key);

  @override
  _NavBodyState createState() => _NavBodyState();
}

class _NavBodyState extends State<NavBody> {
  final List<Widget> _children = [
    LikedView(),
    AddView(),
    SearchScreen(),
    ListenLaterView()
  ];
  final List<PersistentBottomNavBarItem> _navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite),
      title: 'Liked',
      inactiveColorPrimary: AppTheme.primaryColor,
      activeColorPrimary: AppTheme.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: 'Add',
      inactiveColorPrimary: AppTheme.primaryColor,
      activeColorPrimary: AppTheme.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: 'Search',
      inactiveColorPrimary: AppTheme.primaryColor,
      activeColorPrimary: AppTheme.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.watch_later),
      title: 'ListenLater',
      inactiveColorPrimary: AppTheme.primaryColor,
      activeColorPrimary: AppTheme.primaryColor,
    ),
  ];

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _children,
      items: _navBarItems,
      confineInSafeArea: true,
      stateManagement: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.selectedNavBarBackgroundColor,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(colorBehindNavBar: Colors.transparent),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
