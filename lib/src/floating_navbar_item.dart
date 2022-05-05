import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final String title;
  final IconData? selectedIcon;
  final IconData? unselectedIcon;

  final Widget? customWidget;

  FloatingNavbarItem({
    this.selectedIcon,
    this.unselectedIcon,
    this.title = '',
    this.customWidget,
  }) : assert(selectedIcon != null || customWidget != null);
}
