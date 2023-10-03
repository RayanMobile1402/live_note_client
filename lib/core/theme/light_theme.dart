import 'package:flutter/material.dart';

import '../utils/font_util.dart';
import '../utils/utils.dart';
import 'app_color_blindness.dart';
import 'base_theme.dart';

class LightTheme extends BaseTheme {
  LightTheme(ColorBlindnessType type) {
    changeColorBlindnessType(type);
  }

  @override
  ThemeData createTheme(
      FontUtil fontUtil,
      ) =>
      ThemeData(
        primaryColor: primarySwatch,
        colorScheme: colorBlindnessColorScheme(
          ColorScheme.fromSwatch(
            primarySwatch: primarySwatch,
            accentColor: secondaryColor.value,
            backgroundColor: scaffoldBackgroundColor.value,
            cardColor: cardColor.value,
            errorColor: dangerColor.value,
          ),
          fontUtil.currentBlindnessType.value,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(width: 1, color: borderColor.value),
        ),
        fontFamily: currentFontFamily,
        disabledColor: disabledColor.value,
        scaffoldBackgroundColor: scaffoldBackgroundColor.value,
        textTheme: textTheme(fontUtil, textColor.value),
        filledButtonTheme: _lightFilledButtonTheme(fontUtil),
        textButtonTheme: _lightFlatButtonTheme(fontUtil),
        floatingActionButtonTheme: lightFloatingActionButtonThemeData(),
        elevatedButtonTheme: lightElevatedButtonThemeData(),
        outlinedButtonTheme: lightOutlinedButtonThemeData(fontUtil),
        buttonTheme: lightButtonThemeData(),
        iconButtonTheme: lightIconButtonThemeData(),
        tabBarTheme: _tabBarTheme(fontUtil),
        inputDecorationTheme: _lightInputTheme(),
        textSelectionTheme: TextSelectionThemeData(cursorColor: primarySwatch),
        listTileTheme: ListTileThemeData(
          iconColor: textColor.value,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: cardColor.value,
        ),
        iconTheme: IconThemeData(
          color: textColor.value,
        ),
        cardColor: cardColor.value,
        dialogBackgroundColor: cardColor.value,
      );

  TabBarTheme _tabBarTheme(FontUtil fontUtil) => TabBarTheme(
    labelColor: textColor.value,
    labelStyle: textTheme(fontUtil, textColor.value).labelMedium,
    unselectedLabelStyle: textTheme(fontUtil, textColor.value).labelMedium,
    unselectedLabelColor: disabledColor.value,
  );

  IconButtonThemeData lightIconButtonThemeData() => IconButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(
          style: BorderStyle.solid,
          color: secondaryColor.value,
          width: 2,
        ),
      ),
    ),
  );

  ButtonThemeData lightButtonThemeData() => ButtonThemeData(
    buttonColor: secondaryColor.value,
    textTheme: ButtonTextTheme.accent,
    shape: const RoundedRectangleBorder(
      borderRadius: Utils.normalRadius,
    ),
  );

  OutlinedButtonThemeData lightOutlinedButtonThemeData(
      final FontUtil fontUtil) =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch).labelMedium!.copyWith(
              fontSize: 16,
              color: primarySwatch,
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              style: BorderStyle.solid,
              color: primarySwatch,
              width: 0.9,
            ),
          ),
        ),
      );

  ElevatedButtonThemeData lightElevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
          backgroundColor: secondaryColor.value,
          foregroundColor: cardColor.value,
        ),
      );

  FloatingActionButtonThemeData lightFloatingActionButtonThemeData() =>
      FloatingActionButtonThemeData(
        backgroundColor: secondaryColor.value,
        splashColor: cardColor.value,
        foregroundColor: cardColor.value,
      );

  InputDecorationTheme _lightInputTheme() => InputDecorationTheme(
    labelStyle: const TextStyle(fontSize: 50),
    suffixStyle: const TextStyle(fontSize: 50),
    hintStyle: const TextStyle(fontSize: 50),
    iconColor: primarySwatch,
    suffixIconColor: primarySwatch,
    floatingLabelStyle: const TextStyle(fontSize: 50),
    contentPadding:
    const EdgeInsets.only(left: 8, bottom: 4, right: 4, top: 4),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor.value,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor.value,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primarySwatch,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade100,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: dangerColor.value,
      ),
    ),
  );

  FilledButtonThemeData _lightFilledButtonTheme(FontUtil fontUtil) =>
      FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            primarySwatch,
          ),
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch).labelMedium!.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );

  TextButtonThemeData _lightFlatButtonTheme(FontUtil fontUtil) =>
      TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch)
                .titleSmall!
                .copyWith(color: Colors.blue),
          ),
        ),
      );

  @override
  void changeColorBlindnessType(ColorBlindnessType type) {

    primarySwatch = MaterialColor(
      0xFF079992,
      {
        50: colorBlindness(const Color(0xFFe6f5f4), type),
        100: colorBlindness(const Color(0xFFcdebe9), type),
        200: colorBlindness(const Color(0xff9cd6d3), type),
        300: colorBlindness(const Color(0xff83ccc9), type),
        400: colorBlindness(const Color(0xff6ac2be), type),
        500: colorBlindness(const Color(0xff51b8b3), type),
        600: colorBlindness(const Color(0xff39ada8), type),
        700: colorBlindness(const Color(0xff20a39d), type),
        800: colorBlindness(const Color(0xff079992), type),
        900: colorBlindness(const Color(0xff068a83), type),
      },
    );

    chipBackgroundColor.value = colorBlindness(const Color(0xffFFD7D5), type);
    chipBackgroundColor2.value = colorBlindness(const Color(0xffE2E8F0), type);
    iconBackgroundColor.value = colorBlindness(const Color(0xffCAE3FE), type);
    secondaryColor.value = colorBlindness(const Color(0xff054F6B), type);
    departColor.value = colorBlindness(const Color(0xff6F4FAA), type);
    textColor.value = const Color(0xff000000);
    dangerColor.value = const Color(0xffEB3939);
    endColor.value = const Color(0xff008299);
    warningColor.value = const Color(0xffF57F17);
    successColor.value = const Color(0xff55AA15);
    scaffoldBackgroundColor.value = const Color(0xffF0F1F3);
    infoColor.value = const Color(0xff4F46E5);
    cardColor.value = Colors.white;
    communicationMineItemColor.value = const Color(0xffD9FDD3);
    communicationOthersItemColor.value = const Color(0xffffffff);
    borderColor.value = const Color(0xffd3d3d3);
    communicationMaskedColor.value = Colors.blue.shade100;
    disabledColor.value = Colors.grey.withOpacity(.8);
  }
}
