/*
// views/main_shell.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/views/screens/cart.dart';
import 'package:orix_food/views/screens/category.dart';
import 'package:orix_food/views/screens/home.dart';
import 'package:orix_food/views/screens/menu.dart';
import 'package:orix_food/views/screens/order.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomeScreen(), // Your untouched original screen
        CategoryScreen(),
        CartScreen(),
        MenuScreen(),
        OrderScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: "Home",
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_border),
          title: "Category",
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: "Cart",
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.receipt_long_outlined),
          title: "Menu",
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.grid_view),
          title: "Order",
          activeColorPrimary: CupertinoColors.systemRed,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],
      backgroundColor: Colors.grey.shade900,
      navBarStyle: NavBarStyle.style15,
      hideNavigationBarWhenKeyboardAppears: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      padding: const EdgeInsets.only(top: 8),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:orix_food/views/screens/category.dart';
import 'package:orix_food/views/screens/home.dart';
import 'package:orix_food/views/screens/menu.dart';
import 'package:orix_food/views/screens/order.dart';

import '../widgets/custom_navbar.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    //DiscoveryPage(),
    CategoryScreen(),
    OrderScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: CustomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
