import 'package:get/get.dart';

import '../../../shared/models/blindness_type.dart';
import '../../utils/font_util.dart';
import '../app_color_blindness.dart';
import '../base_theme.dart';
import '../light_theme.dart';
import '../theme_type.dart';

class ThemeController extends GetxController {
  Rx<FontUtil> fontUtil = FontUtil().obs;

  RxDouble currentFontSliderValue = 1.0.obs;

  Rx<BlindnessType> currentBlindnessType = BlindnessType.none.obs;
  Rx<ThemeType> currentThemeType = ThemeType.light.obs;

  Rxn<BaseTheme> baseTheme = Rxn(LightTheme(ColorBlindnessType.none));

  void changeAppTheme(BaseTheme theme) {
    if (theme is LightTheme) {
      currentThemeType.value = ThemeType.light;
    } else {
      currentThemeType.value = ThemeType.dark;
    }
    print('before : ${baseTheme.value.runtimeType}');
    baseTheme.value=null;
    baseTheme.value = theme;
    print('after : ${baseTheme.value.runtimeType}');
  }

  void changeColorBlindnessType(final BlindnessType type) {
    currentBlindnessType.value = type;
    baseTheme.value!.changeColorBlindnessType(type.type);
  }

  void changeFontFamily(final FontEnum value) {
    fontUtil.value.font.value = value;
    baseTheme.value!.currentFontFamily = value.name;
  }

  void changeFontSize(final double value) {
    fontUtil.value.titleLarge.value = fontUtil.value.kTitleLarge;
    fontUtil.value.titleLarge.value = fontUtil.value.kTitleLarge +
        (fontUtil.value.kTitleLarge * (value * 0.05));

    fontUtil.value.titleMedium.value = fontUtil.value.kTitleMedium;
    fontUtil.value.titleMedium.value = fontUtil.value.kTitleMedium +
        (fontUtil.value.kTitleMedium * (value * 0.05));

    fontUtil.value.titleSmall.value = fontUtil.value.kTitleSmall;
    fontUtil.value.titleSmall.value = fontUtil.value.kTitleSmall +
        (fontUtil.value.kTitleSmall * (value * 0.05));

    fontUtil.value.displayLarge.value = fontUtil.value.kDisplayLarge;
    fontUtil.value.displayLarge.value = fontUtil.value.kDisplayLarge +
        (fontUtil.value.kDisplayLarge * (value * 0.05));

    fontUtil.value.displayMedium.value = fontUtil.value.kDisplayMedium;
    fontUtil.value.displayMedium.value = fontUtil.value.kDisplayMedium +
        (fontUtil.value.kDisplayMedium * (value * 0.05));

    fontUtil.value.displaySmall.value = fontUtil.value.kDisplaySmall;
    fontUtil.value.displaySmall.value = fontUtil.value.kDisplaySmall +
        (fontUtil.value.kDisplaySmall * (value * 0.05));

    fontUtil.value.bodyLarge.value = fontUtil.value.kBodyLarge;
    fontUtil.value.bodyLarge.value = fontUtil.value.kBodyLarge +
        (fontUtil.value.kBodyLarge * (value * 0.05));

    fontUtil.value.bodyMedium.value = fontUtil.value.kBodyMedium;
    fontUtil.value.bodyMedium.value = fontUtil.value.kBodyMedium +
        (fontUtil.value.kBodyMedium * (value * 0.05));

    fontUtil.value.bodySmall.value = fontUtil.value.kBodySmall;
    fontUtil.value.bodySmall.value = fontUtil.value.kBodySmall +
        (fontUtil.value.kBodySmall * (value * 0.05));

    fontUtil.value.headlineLarge.value = fontUtil.value.kHeadlineLarge;
    fontUtil.value.headlineLarge.value = fontUtil.value.kHeadlineLarge +
        (fontUtil.value.kHeadlineLarge * (value * 0.05));

    fontUtil.value.headlineMedium.value = fontUtil.value.kHeadlineMedium;
    fontUtil.value.headlineMedium.value = fontUtil.value.kHeadlineMedium +
        (fontUtil.value.kHeadlineMedium * (value * 0.05));

    fontUtil.value.headlineSmall.value = fontUtil.value.kHeadlineSmall;
    fontUtil.value.headlineSmall.value = fontUtil.value.kHeadlineSmall +
        (fontUtil.value.kHeadlineSmall * (value * 0.05));

    fontUtil.value.labelLarge.value = fontUtil.value.kLabelLarge;
    fontUtil.value.labelLarge.value = fontUtil.value.kLabelLarge +
        (fontUtil.value.kLabelLarge * (value * 0.05));

    fontUtil.value.labelMedium.value = fontUtil.value.kLabelMedium;
    fontUtil.value.labelMedium.value = fontUtil.value.kLabelMedium +
        (fontUtil.value.kLabelMedium * (value * 0.05));

    fontUtil.value.labelSmall.value = fontUtil.value.kLabelSmall;
    fontUtil.value.labelSmall.value = fontUtil.value.kLabelSmall +
        (fontUtil.value.kLabelSmall * (value * 0.05));
    currentFontSliderValue.value = value;
  }
}
