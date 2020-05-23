import 'package:floating_bottom_navigation_bar/src/floating_navbar_item.dart';
import 'package:flutter/material.dart';

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;

  const FloatingNavbar(
      {Key key,
      @required this.items,
      @required this.currentIndex,
      @required this.onTap,
      this.backgroundColor = Colors.black,
      this.selectedBackgroundColor = Colors.white,
      this.selectedItemColor = Colors.black,
      this.iconSize = 24.0,
      this.fontSize = 11.0,
      this.borderRadius = 8,
      this.itemBorderRadius = 8,
      this.unselectedItemColor = Colors.white})
      : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
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
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: widget.backgroundColor,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: items.map((f) {
                    return Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                                color: widget.currentIndex == items.indexOf(f) ? widget.selectedBackgroundColor : widget.backgroundColor,
                                borderRadius: BorderRadius.circular(widget.itemBorderRadius)),
                            child: InkWell(
                              onTap: () {
                                this.widget.onTap(items.indexOf(f));
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                //max-width for each item
                                //24 is the padding from left and right
                                width: MediaQuery.of(context).size.width * (100 / (items.length * 100)) - 24,
                                padding: EdgeInsets.all(4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      f.icon,
                                      color: widget.currentIndex == items.indexOf(f) ? widget.selectedItemColor : widget.unselectedItemColor,
                                      size: widget.iconSize,
                                    ),
                                    Text(
                                      '${f.title}',
                                      style: TextStyle(
                                          color: widget.currentIndex == items.indexOf(f) ? widget.selectedItemColor : widget.unselectedItemColor,
                                          fontSize: widget.fontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
