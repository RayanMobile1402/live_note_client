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
            accentColor: secondaryColor,
            backgroundColor: scaffoldBackgroundColor,
            cardColor: cardColor,
            errorColor: dangerColor,
          ),
          fontUtil.currentBlindnessType.value,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(width: 1, color: borderColor),
        ),
        fontFamily: currentFontFamily,
        disabledColor: disabledColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: textTheme(fontUtil, textColor),
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
          iconColor: textColor,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: cardColor,
        ),
        iconTheme: IconThemeData(
          color: textColor,
        ),
        cardColor: cardColor,
        dialogBackgroundColor: cardColor,
      );

  TabBarTheme _tabBarTheme(FontUtil fontUtil) => TabBarTheme(
    labelColor: textColor,
    labelStyle: textTheme(fontUtil, textColor).labelMedium,
    unselectedLabelStyle: textTheme(fontUtil, textColor).labelMedium,
    unselectedLabelColor: disabledColor,
  );

  IconButtonThemeData lightIconButtonThemeData() => IconButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(
          style: BorderStyle.solid,
          color: secondaryColor,
          width: 2,
        ),
      ),
    ),
  );

  ButtonThemeData lightButtonThemeData() => ButtonThemeData(
    buttonColor: secondaryColor,
    textTheme: ButtonTextTheme.accent,
    shape: const RoundedRectangleBorder(
      borderRadius: Utils.normalRadius,
    ),
  );

  OutlinedButtonThemeData lightOutlinedButtonThemeData(
      final FontUtil fontUtil,) =>
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
          backgroundColor: secondaryColor,
          foregroundColor: cardColor,
        ),
      );

  FloatingActionButtonThemeData lightFloatingActionButtonThemeData() =>
      FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
        splashColor: cardColor,
        foregroundColor: cardColor,
      );

  InputDecorationTheme _lightInputTheme() => InputDecorationTheme(
    labelStyle: const TextStyle(fontSize: 18),
    suffixStyle: const TextStyle(fontSize: 18),
    hintStyle: const TextStyle(fontSize: 18),
    iconColor: primarySwatch,
    suffixIconColor: primarySwatch,
    floatingLabelStyle: const TextStyle(fontSize: 16),
    contentPadding:
    const EdgeInsets.only(left: 8, bottom: 4, right: 4, top: 4),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
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
        color: dangerColor,
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

    primarySwatch =  const MaterialColor(
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

    chipBackgroundColor = colorBlindness(const Color(0xffFFD7D5), type);
    chipBackgroundColor2 = colorBlindness(const Color(0xffE2E8F0), type);
    iconBackgroundColor = colorBlindness(const Color(0xffCAE3FE), type);
    secondaryColor = colorBlindness(const Color(0xff054F6B), type);
    departColor = colorBlindness(const Color(0xff6F4FAA), type);
    textColor = const Color(0xff000000);
    dangerColor = const Color(0xffEB3939);
    endColor = const Color(0xff008299);
    warningColor = const Color(0xffF57F17);
    successColor = const Color(0xff55AA15);
    scaffoldBackgroundColor = const Color(0xffF0F1F3);
    infoColor = const Color(0xff4F46E5);
    cardColor = Colors.white;
    communicationMineItemColor = const Color(0xffD9FDD3);
    communicationOthersItemColor = const Color(0xffffffff);
    borderColor = const Color(0xffd3d3d3);
    communicationMaskedColor = Colors.blue.shade100;
    disabledColor = Colors.grey.withOpacity(.8);



  }
}
