import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/theme_bloc.dart';

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
        title: Text("Dynamic Theme"),
      ),
      drawer: createDrawer(),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
