import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/theme_bloc.dart';
import 'package:login_bloc/ui/app/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeBloc _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _themeBloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) 
      => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(_themeBloc),
        ),
    );
  }
}
