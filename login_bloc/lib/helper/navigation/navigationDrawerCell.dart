import 'package:flutter/material.dart';
import 'package:login_bloc/theme.dart';

class NavigationDrawerCell extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  NavigationDrawerCell(
      {@required this.title,
      @required this.icon,
      @required this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _NavigationDrawerCellState createState() => _NavigationDrawerCellState();
}

class _NavigationDrawerCellState extends State<NavigationDrawerCell> {
  Animation<double> widthAnimation, sizeBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 220, end: 70).animate(widget.animationController);
    sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  Widget createRow() => Row(
    children: <Widget>[
      Icon(
        widget.icon, 
        color: widget.isSelected 
          ? selectedColor 
          : Colors.white30, 
          size: 38
      ),
      SizedBox(width: sizeBoxAnimation.value),
      (widthAnimation.value >= 220)
        ? Text(widget.title, style: widget.isSelected ? listTitleSelectedTextStyle : listTitleDefaultTextStyle)
        : Container(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.transparent
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: createRow(),
      ),
    );
  }
}
