import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/size_config.dart';

/// Create a [ThemeData] static [ThemeData.LightTheme] or [ThemeData.DarkTheme]
///
///
/// The most useful values to give are, in order of importance:
///
///  * The primary color for the app background the [scaffoldBackgroundColor],
///
///  * The desired theme [brightness].
///
///  * The [textTheme], used to configure the text theme
///
///  * The [AppBarTheme], used to configure the app bar theme
class AppTheme {
  AppTheme._();

  //static String _fontFamily = FontFamily.sfPro;
  static const Color appBackgroundColor = Color(0xffffffff);
  static const Color subtitleTextColor = Colors.grey;

  /// Light theme
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
    ),
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: _lightTextTheme,
    fontFamily: FontFamily.sfPro,
  );

  static final _lightTextTheme = TextTheme(
    title: _titleLight,
    subtitle: _subtitleLight,
    button: _buttonLight,
    display1: _greetingLight,
    display2: _searchLight,
    body1: _selectedTabLight,
    body2: _unselectedTabLight,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subtitleLight = TextStyle(
    color: subtitleTextColor,
    fontSize: 2 * SizeConfig.textMultiplier,
    //height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 2.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unselectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  /// Dark theme

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
    fontFamily: FontFamily.sfPro,
  );

  static final TextTheme darkTextTheme = TextTheme(
    title: _titleDark,
    subtitle: _subtitleDark,
    button: _buttonDark,
    display1: _greetingDark,
    display2: _searchDark,
    body1: _selectedTabDark,
    body2: _unselectedTabDark,
  );

  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);

  static final TextStyle _subtitleDark =
      _subtitleLight.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark =
      _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchLight.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark =
      _selectedTabLight.copyWith(color: Colors.white);

  static final TextStyle _unselectedTabDark =
      _selectedTabLight.copyWith(color: Colors.white70);
}

class FontFamily {
  FontFamily._();

  static String get sfPro => 'SF-Pro';
  static String get montserrat => 'Montserrat';
}
