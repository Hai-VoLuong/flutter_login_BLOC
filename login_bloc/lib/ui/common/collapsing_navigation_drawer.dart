import 'package:flutter/material.dart';
import 'package:login_bloc/model/navigation_model.dart';
import 'package:login_bloc/theme.dart';
import 'package:login_bloc/ui/common/collapsing_list_title.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState
    extends State<CollapsingNavigationDrawer> {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          CollasingListTitle(
            title: 'Sarah Pulson',
            icon: Icons.person,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navigationModels.length,
              itemBuilder: (context, counter) {
                return CollasingListTitle(
                  title: navigationModels[counter].title,
                  icon: navigationModels[counter].icon,
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Icon(Icons.chevron_left, color: Colors.white, size: 50),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
