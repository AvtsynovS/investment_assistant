import 'package:flutter/material.dart';
import 'package:investment_assistant/src/themes/theme.dart';

class CustomTheme {
  // ##### Light Theme #####
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(checkedLightColor),
      fillColor: MaterialStateProperty.all(checkboxBackgroundLightColor),
      shape: const CircleBorder(),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: tileLightColor,
      horizontalTitleGap: 20.0,
    ),
    fontFamily: 'Roboto',
    dialogBackgroundColor: AppColors.white,
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor;
        }
        return primaryLightColor;
      }),
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor.withOpacity(.48);
        }
        return primaryLightColor.withOpacity(.48);
      }),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lighterGrey),
      ),
      fillColor: AppColors.disabledLightThemeColor,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(color: Colors.red),
      menuStyle: MenuStyle(
        mouseCursor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return SystemMouseCursors.forbidden;
            }
            if (states.contains(MaterialState.pressed)) {
              return SystemMouseCursors.forbidden;
            }
            if (states.contains(MaterialState.focused)) {
              return SystemMouseCursors.forbidden;
            }
            return SystemMouseCursors.click;
          },
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lighterGrey),
        ),
        fillColor: AppColors.disabledLightThemeColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryLightColor,
    ),
    dialogTheme: const DialogTheme(
      alignment: Alignment.center,
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.black,
        wordSpacing: 1,
      ),
    ),
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryLightColor,
      secondary: secondaryLightColor,
      background: backgroundLightColor,
      tertiaryContainer: tertiaryLightContainer,
      
    ),
    splashColor: splashLightColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryLightColor,
        selectedItemColor: foregroundLightColor,
        unselectedItemColor: foregroundLightColor,
        selectedLabelStyle: TextStyle(color: foregroundLightColor),
        selectedIconTheme: IconThemeData(color: foregroundLightColor)),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundLightColor,
      foregroundColor: foregroundLightColor,
      iconTheme: IconThemeData(
        color: primaryLightColor,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: headlineMedium.copyWith(color: foregroundLightColor),
      headlineSmall: headlineSmall.copyWith(color: primaryLightColor),
      labelSmall: labelSmall,
      bodyMedium: bodyMedium,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: backgroundDialogLightColor,
    ),
  );

  // ##### Dark Theme #####
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(checkedDarkColor),
      fillColor: MaterialStateProperty.all(checkboxBackgroundDarkColor),
      shape: const CircleBorder(),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: tileDarkColor,
      horizontalTitleGap: 20.0,
    ),
    fontFamily: 'Roboto',
    dialogBackgroundColor: foregroundDarkColor,
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor;
        }
        return primaryLightColor;
      }),
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor.withOpacity(.48);
        }
        return primaryLightColor.withOpacity(.48);
      }),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lighterGrey),
      ),
      fillColor: AppColors.disabledDarkThemeColor,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(color: Colors.red),
      menuStyle: MenuStyle(
        mouseCursor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return SystemMouseCursors.forbidden;
            }
            if (states.contains(MaterialState.pressed)) {
              return SystemMouseCursors.forbidden;
            }
            if (states.contains(MaterialState.focused)) {
              return SystemMouseCursors.forbidden;
            }
            return SystemMouseCursors.click;
          },
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lighterGrey),
        ),
        fillColor: AppColors.disabledDarkThemeColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryDarkColor,
    ),
    dialogTheme: const DialogTheme(
      alignment: Alignment.center,
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.white,
        wordSpacing: 1,
      ),
    ),
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryDarkColor,
      secondary: secondaryDarkColor,
      background: backgroundDarkColor,
      tertiaryContainer: tertiaryDarkContainer,
    ),
    splashColor: splashDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryDarkColor,
        selectedItemColor: foregroundDarkColor,
        unselectedItemColor: foregroundDarkColor,
        selectedLabelStyle: TextStyle(color: foregroundDarkColor),
        selectedIconTheme: IconThemeData(color: foregroundDarkColor)),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDarkColor,
      foregroundColor: foregroundDarkColor,
      iconTheme: IconThemeData(
        color: primaryDarkColor,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: headlineMedium.copyWith(color: foregroundDarkColor),
      headlineSmall: headlineSmall.copyWith(color: primaryDarkColor),
      // Отвечает за текст в NavigationBar
      labelSmall: labelSmall,
      // Отвечает за обычный шрифт в приложении
      bodyMedium: bodyMedium,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: backgroundDialogDarkColor,
    ),
  );
}
