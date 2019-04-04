import 'package:flutter/material.dart';
import 'package:login_bloc/model/navigation_model.dart';
import 'package:login_bloc/theme.dart';
import 'package:login_bloc/ui/common/collapsing_list_title.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 60;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
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

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          CollasingListTitle(
            title: 'Sarah Pulson',
            icon: Icons.person,
            animationController: _animationController,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navigationModels.length,
              itemBuilder: (context, counter) {
                return CollasingListTitle(
                  title: navigationModels[counter].title,
                  icon: navigationModels[counter].icon,
                  animationController: _animationController,
                );
              },
            ),
          ),
          InkWell(
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
              size: 50
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
