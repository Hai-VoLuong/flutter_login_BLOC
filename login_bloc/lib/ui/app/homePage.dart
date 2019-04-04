import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/theme_bloc.dart';
import 'package:login_bloc/theme.dart';
import 'package:login_bloc/ui/common/collapsing_navigation_drawer.dart';

class HomePage extends StatelessWidget {
  final ThemeBloc _themeBloc;

  HomePage(
    this._themeBloc,
  );

  Widget createDrawer() {
    return Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Change Theme",
                style: TextStyle(
                  color: _themeBloc.isChangeTheme ? Colors.white : Colors.red,
                ),
              ),
              trailing: Switch(
                value: _themeBloc.isChangeTheme,
                onChanged: (theme) {
                  _themeBloc.changeTheme(theme);
                },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: drawerBackgroundColor,
        title: Text("Dynamic Theme"),
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Stack(
        children: <Widget>[
          Container(color: Colors.lightBlue[300]),
          CollapsingNavigationDrawer()
        ],
      ),
    );
  }
}
