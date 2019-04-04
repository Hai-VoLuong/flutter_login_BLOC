import 'package:flutter/material.dart';
import 'package:login_bloc/helper/navigation/navigationDrawerCell.dart';
import 'package:login_bloc/helper/navigation/navigationModel.dart';
import 'package:login_bloc/theme.dart';



class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 220;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget createButonIconBottom() {
    return InkWell(
      onTap: () {
        setState(() {
          isCollapsed = !isCollapsed;
          isCollapsed
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      child: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: _animationController,
          color: Colors.white,
          size: 50),
    );
  }

  Widget createBody() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, counter) {
          return Divider(height: 12);
        },
        itemCount: navigationModels.length,
        itemBuilder: (context, counter) {
          return NavigationDrawerCell(
            onTap: () {
              setState(() {
                currentSelectedIndex = counter;
              });
            },
            isSelected: currentSelectedIndex == counter,
            title: navigationModels[counter].title,
            icon: navigationModels[counter].icon,
            animationController: _animationController,
          );
        },
      ),
    );
  }

  Widget createHeaderInfo() {
    return NavigationDrawerCell(
      title: 'Sarah Pulson',
      icon: Icons.person,
      animationController: _animationController,
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            createHeaderInfo(),
            Divider(color: Colors.grey, height: 40),
            createBody(),
            createButonIconBottom(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
