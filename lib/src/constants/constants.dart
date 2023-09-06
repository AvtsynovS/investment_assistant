part of '../themes/theme.dart';

// Размеры шрифтов
const double largeTextSize = 26.0;
const double mediumTextSize = 20.0;
const double bodyTextSize = 14.0;

// Названия шрифтов
const String defaultFont = '';
const String titleFont = '';

// Dark Theme Colors
const Color primaryDarkColor = Color(0xFFE3B50B);
const Color secondaryDarkColor = Color(0xFF06BF28); // потом исправить цвет
const Color tertiaryDarkContainer = Color.fromARGB(67, 45, 35, 2);
const Color backgroundDialogDarkColor = Color(0xFF4A4747);
const Color foregroundDarkColor = Color(0xFF4A4747);
const Color backgroundDarkColor = Color(0xFFE3B50B);
const Color primaryBackgroundDarkColor =
    Color(0x7CE3B40B); // потом исправить цвет
const Color shadowDarkColor = Color(0xFF000000); // потом исправить цвет
const Color tileDarkColor = Color(0xFF424242);
const Color splashDarkColor = Color.fromARGB(255, 197, 225, 14);
const Color checkedDarkColor = Color(0xFF000000);
const Color checkboxBackgroundDarkColor = primaryDarkColor;

// Light Theme Colors ПЕРЕДЕЛАТЬ
const Color primaryLightColor = Color(0xFF8D12AB);
const Color secondaryLightColor = Color(0xFF3DA565);
const Color secondaryBackgroundLightColor = Color(0xBC4E3915);
const Color tertiaryLightContainer = Color.fromARGB(255, 244, 244, 244);
const Color backgroundDialogLightColor = Color(0xFFDEDADA);
const Color foregroundLightColor = Color(0xFF292424);
const Color backgroundLightColor = Color(0xFF8D12AB);
const Color shadowLightColor = Color(0xFF000000);
const Color tileLightColor = Color(0xFFE0E0E0);
const Color splashLightColor = Color.fromARGB(255, 197, 225, 14);
const Color checkedLightColor = Color(0xFFFFFFFF);
const Color checkboxBackgroundLightColor = primaryLightColor;

const headlineSmall = TextStyle(
  // fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  // color: primaryDarkColor,
);
const headlineMedium = TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
const bodyMedium = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  // fontFamily: 'Roboto',
);
const labelSmall = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  // fontFamily: 'Roboto',
);
const headline2 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  // fontFamily: 'Roboto',
);

abstract class LightTheme {
  static const white = Colors.white;
}

abstract class DarkTheme {
  static const black = Colors.black;
}

abstract class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const blue = Colors.blue;

  static const red = Colors.red;
  static const darkerRed = Color(0xFFCB5A5E);

  static const grey = Colors.grey;
  static const darkerGrey = Color(0xFF6C6C6C);
  static const darkestGrey = Color(0xFF626262);
  static const lighterGrey = Color(0xFF959595);
  static const lightGrey = Color(0xFF5d5d5d);

  static const lighterDark = Color(0xFF272727);
  static const lightDark = Color(0xFF1b1b1b);

  static const purpleAccent = Colors.purpleAccent;
}
