import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Floating NavBar Example',
        home: Scaffold(
          body: pages[selectedIndex],
          bottomNavigationBar: FloatingNavbar(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            selectedBackgroundColor: Colors.transparent,
            backgroundColor: Palette.bottomNavBarColor,
            selectedItemColor: Palette.darkGrey,
            unselectedItemColor: Palette.lightGrey,
            borderRadius: 10,
            onTap: (int val) => setState(() => selectedIndex = val),
            currentIndex: selectedIndex,
            items: [
              FloatingNavbarItem(
                selectedIcon: Icons.home,
                unselectedIcon: Icons.home_outlined,
              ),
              FloatingNavbarItem(
                selectedIcon: Icons.ac_unit,
                unselectedIcon: Icons.ac_unit,
              ),
              FloatingNavbarItem(selectedIcon: Icons.chat_bubble, unselectedIcon: Icons.chat_bubble_outline),
              FloatingNavbarItem(selectedIcon: Icons.person, unselectedIcon: Icons.person_off_outlined),
              FloatingNavbarItem(selectedIcon: Icons.notifications, unselectedIcon: Icons.notifications_none),
            ],
          ),
        ));
  }
}

mixin Palette {
  static Color bottomNavBarColor = const Color(0xFFFAFAFA);
  static Color lightGrey = const Color(0xFFB8BDBF);
  static Color darkGrey = const Color(0xFF353535);
}
