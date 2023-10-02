import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/font_util.dart';
import 'app_color_blindness.dart';

abstract class BaseTheme {
  String currentFontFamily = 'Quicksand';

  Rx<Color> primarySwatch = const Color(
    0xFF079992,
  ).obs;
  Rx<Color> secondaryColor = const Color(0xff054F6B).obs;
  Rx<Color> warningColor = const Color(0xffF57F17).obs;
  Rx<Color> dangerColor = const Color(0xffEB3939).obs;
  Rx<Color> successColor = const Color(0xff55AA15).obs;
  Rx<Color> infoColor = const Color(0xff46A5E5).obs;
  Rx<Color> white = Colors.white.obs;
  Rx<Color> black = Colors.black.obs;
  Rx<Color> bookedColor = const Color(0xff82828F).obs;
  Rx<Color> departColor = const Color(0xff6F4FAA).obs;
  Rx<Color> endColor = const Color(0xff008299).obs;
  Rx<Color> chipBackgroundColor = const Color(0xffFFD7D5).obs;
  Rx<Color> chipBackgroundColor2 = const Color(0xffE2E8F0).obs;
  Rx<Color> iconBackgroundColor = const Color(0xffCAE3FE).obs;
  Rx<Color> textColor = const Color(0xff000000).obs;
  Rx<Color> scaffoldBackgroundColor = const Color(0xffF0F1F3).obs;
  Rx<Color> cardColor = Colors.white.obs;
  Rx<Color> communicationMineItemColor = const Color(0xffD9FDD3).obs;
  Rx<Color> communicationOthersItemColor = const Color(0xffffffff).obs;
  Rx<Color> borderColor = const Color(0xffd3d3d3).obs;
  Rx<Color> communicationMaskedColor = Colors.blue.shade100.obs;
  Rx<Color> disabledColor = Colors.grey.withOpacity(.8).obs;

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
