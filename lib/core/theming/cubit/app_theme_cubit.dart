import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:should_todo/core/models/enums/theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final SharedPreferences sharedPreferences;

  AppThemeCubit(this.sharedPreferences) : super(AppThemeInitial());

  void changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        if (sharedPreferences.getString('theme') != null) {
          if (sharedPreferences.getString('theme') == 'l') {
            emit(AppLightTheme());
          } else if (sharedPreferences.getString('theme') == 'd') {
            emit(AppDarkTheme());
          }
        }
        break;
      case ThemeState.light:
        sharedPreferences.setString('theme', 'l');
        emit(AppLightTheme());
        break;
      case ThemeState.dark:
        sharedPreferences.setString('theme', 'd');
        emit(AppDarkTheme());
        break;
    }
  }
}
