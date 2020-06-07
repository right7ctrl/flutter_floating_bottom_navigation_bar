import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final String title;
  final IconData icon;
  final Widget customWidget;

  FloatingNavbarItem({
    @required this.icon,
    @required this.title,
    this.customWidget = const SizedBox(),
  });
}
