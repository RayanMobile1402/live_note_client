import 'package:flutter/material.dart';

import '../utils/font_util.dart';
import 'app_color_blindness.dart';

abstract class BaseTheme {
  String currentFontFamily = 'Quicksand';

  MaterialColor primarySwatch = const MaterialColor(
    0xFF10AC84,
    {
      50: Color(0xFF10AC84),
      100: Color(0xFF10AC84),
      200: Color(0xFF10AC84),
      300: Color(0xFF10AC84),
      400: Color(0xFF10AC84),
      500: Color(0xFF10AC84),
      600: Color(0xFF10AC84),
      700: Color(0xFF10AC84),
      800: Color(0xFF10AC84),
      900: Color(0xFF10AC84),
    },
  );
  Color secondaryColor = const Color(0xff054F6B);
  Color warningColor = const Color(0xffF57F17);
  Color dangerColor = const Color(0xffEB3939);
  Color successColor = const Color(0xff55AA15);
  Color infoColor = const Color(0xff46A5E5);
  Color white = Colors.white;
  Color black = Colors.black;
  Color bookedColor = const Color(0xff82828F);
  Color departColor = const Color(0xff6F4FAA);
  Color endColor = const Color(0xff008299);
  Color chipBackgroundColor = const Color(0xffFFD7D5);
  Color chipBackgroundColor2 = const Color(0xffE2E8F0);
  Color iconBackgroundColor = const Color(0xffCAE3FE);
  Color textColor = const Color(0xff000000);
  Color scaffoldBackgroundColor = const Color(0xffF0F1F3);
  Color cardColor = Colors.white;
  Color communicationMineItemColor = const Color(0xffD9FDD3);
  Color communicationOthersItemColor = const Color(0xffffffff);
  Color borderColor = const Color(0xff3a3a3a);
  Color communicationMaskedColor = Colors.blue.shade100;
  Color disabledColor = Colors.grey.withOpacity(.8);

  ThemeData createTheme(
      FontUtil fontUtil,
      );

  void changeColorBlindnessType(final ColorBlindnessType type);

  TextTheme textTheme(FontUtil fontUtil, final Color color) => TextTheme(
    displayLarge: TextStyle(
      fontSize: fontUtil.displayLarge.value,
      color: color,
    ),
    displayMedium: TextStyle(
      fontSize: fontUtil.displayMedium.value,
      color: color,
    ),
    displaySmall: TextStyle(
      fontSize: fontUtil.displaySmall.value,
      color: color,
    ),
    headlineLarge: TextStyle(
      fontSize: fontUtil.headlineLarge.value,
      color: color,
    ),
    headlineMedium: TextStyle(
      fontSize: fontUtil.headlineMedium.value,
      color: color,
    ),
    headlineSmall: TextStyle(
      fontSize: fontUtil.headlineSmall.value,
      color: color,
    ),
    titleLarge: TextStyle(
      fontSize: fontUtil.titleLarge.value,
      color: color,
    ),
    titleMedium: TextStyle(
      fontSize: fontUtil.titleMedium.value,
      letterSpacing: 0.15,
      color: color,
    ),
    titleSmall: TextStyle(
      fontSize: fontUtil.titleSmall.value,
      letterSpacing: 0.1,
      color: color,
    ),
    labelLarge: TextStyle(
      fontSize: fontUtil.labelLarge.value,
      letterSpacing: 0.1,
      color: color,
    ),
    labelMedium: TextStyle(
      fontSize: fontUtil.labelMedium.value,
      letterSpacing: 0.5,
      color: color,
    ),
    labelSmall: TextStyle(
      fontSize: fontUtil.labelSmall.value,
      letterSpacing: 0.5,
      color: color,
    ),
    bodyLarge: TextStyle(
      fontSize: fontUtil.bodyLarge.value,
      letterSpacing: 0.15,
      color: color,
    ),
    bodyMedium: TextStyle(
      fontSize: fontUtil.bodyMedium.value,
      letterSpacing: 0.25,
      color: color,
    ),
    bodySmall: TextStyle(
      fontSize: fontUtil.bodySmall.value,
      letterSpacing: 0.4,
    ),
  );
}
