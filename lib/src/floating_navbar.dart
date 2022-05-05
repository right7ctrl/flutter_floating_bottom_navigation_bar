import 'package:floating_bottom_navigation_bar/src/floating_navbar_item.dart';
import 'package:flutter/material.dart';

typedef Widget ItemBuilder(BuildContext context, FloatingNavbarItem items);

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem> items;
  final int currentIndex;
  final void Function(int val)? onTap;
  final Color selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;
  final ItemBuilder itemBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final double elevation;

  FloatingNavbar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    ItemBuilder? itemBuilder,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize = 24.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = Colors.white,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.width = double.infinity,
    this.elevation = 0.0,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        this.itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              width: width,
              backgroundColor: backgroundColor,
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
            ),
        super(key: key);

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  List<FloatingNavbarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: widget.elevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: widget.margin,
            child: Container(
              // padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: widget.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: const Offset(-6, -6),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(6, 6),
                    blurRadius: 20,
                  ),
                ],
              ),
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map((f) {
                    return widget.itemBuilder(
                      context,
                      f,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val)? onTap,
  required List<FloatingNavbarItem> items,
  int? currentIndex,
  Color? selectedBackgroundColor,
  Color? selectedItemColor,
  Color? unselectedItemColor,
  Color? backgroundColor,
  double width = double.infinity,
  double? fontSize,
  double? iconSize,
  double? itemBorderRadius,
  double? borderRadius,
}) {
  return (BuildContext context, FloatingNavbarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                onTap!(items.indexOf(item));
              },
              child: SizedBox(
                width: width.isFinite ? (width / items.length - 8) : MediaQuery.of(context).size.width / items.length - 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Icon(
                      currentIndex == items.indexOf(item) ? item.selectedIcon : item.unselectedIcon,
                      color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                      size: iconSize,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipPath(
                        clipper: CustomClip(),
                        child: Container(
                          width: 30,
                          height: 10,
                          color: currentIndex == items.indexOf(item) ? selectedItemColor : Colors.transparent,
                        ),
                      ),
                    ),
                    Text(
                      item.title!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: currentIndex == items.indexOf(item) ? selectedItemColor : unselectedItemColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double radius = 15;

    final Path path = Path();
    path
      ..moveTo(size.width / 2, 0)
      ..arcToPoint(Offset(size.width, size.height), radius: const Radius.circular(radius))
      ..lineTo(0, size.height)
      ..arcToPoint(
        Offset(size.width / 2, 0),
        radius: const Radius.circular(radius),
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
