import 'package:flutter/material.dart';
import 'package:login_bloc/theme.dart';

class CollasingListTitle extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollasingListTitle({
    @required this.title,
    @required this.icon,
    @required this.animationController,
  });

  @override
  _CollasingListTitleState createState() => _CollasingListTitleState();
}

class _CollasingListTitleState extends State<CollasingListTitle> {
  Animation<double> widthAnimation, sizeBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 220, end: 70).animate(widget.animationController);
    sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(widget.icon, color: Colors.white30, size: 38),
          SizedBox(width: sizeBoxAnimation.value),
          (widthAnimation.value >= 220)
              ? Text(widget.title, style: listTitleDefaultTextStyle)
              : Container(),
        ],
      ),
    );
  }
}
