import 'package:get/get.dart';

import '../theme/app_color_blindness.dart';

class FontUtil {
  // --------------------->Display<------------------------

  final double kDisplayLarge = 57;
  final double kDisplaySmall = 36;
  final double kDisplayMedium = 45;

  RxDouble displayLarge = 57.0.obs;
  RxDouble displaySmall = 36.0.obs;
  RxDouble displayMedium = 45.0.obs;

  // --------------------->Headline<------------------------
  final double kHeadlineLarge = 32;
  final double kHeadlineMedium = 28;
  final double kHeadlineSmall = 24;

  RxDouble headlineLarge = 32.0.obs;
  RxDouble headlineMedium = 28.0.obs;
  RxDouble headlineSmall = 24.0.obs;

  // --------------------->Title<------------------------
  final double kTitleLarge = 22;
  final double kTitleMedium = 12;
  final double kTitleSmall = 14;

  RxDouble titleLarge = 22.0.obs;
  RxDouble titleMedium = 16.0.obs;
  RxDouble titleSmall = 14.0.obs;

  // --------------------->Label<------------------------
  final double kLabelLarge = 16;
  final double kLabelMedium = 14;
  final double kLabelSmall = 11;

  RxDouble labelLarge = 16.0.obs;
  RxDouble labelMedium = 14.0.obs;
  RxDouble labelSmall = 11.0.obs;

  // --------------------->Body<------------------------
  final double kBodyLarge = 16;
  final double kBodyMedium = 14;
  final double kBodySmall = 12;

  RxDouble bodyLarge = 16.0.obs;
  RxDouble bodyMedium = 14.0.obs;
  RxDouble bodySmall = 12.0.obs;

  Rx<FontEnum> font = FontEnum.quickSand.obs;

  Rx<ColorBlindnessType> currentBlindnessType = ColorBlindnessType.none.obs;
}

enum FontEnum {
  quickSand('Quicksand'),
  athene('Inter');

  final String path;

  const FontEnum(this.path);
}
