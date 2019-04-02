import 'dart:async';

class ThemeBloc {
  bool isChangeTheme = false;

  final _themeController = StreamController<bool>();
  get darkThemeEnabled => _themeController.stream;

  void changeTheme(bool isTheme){
    isChangeTheme = isTheme;
    _themeController.sink.add(isChangeTheme);
  }

  void dispose() {
    _themeController.close();
  }
}