

import '../../core/theme/app_color_blindness.dart';

enum BlindnessType {
  none(type: ColorBlindnessType.none, value: 1),
  protanomaly(type: ColorBlindnessType.protanomaly, value: 2),
  deuteranomaly(type: ColorBlindnessType.deuteranomaly, value: 3),
  tritanomaly(type: ColorBlindnessType.tritanomaly, value: 4),
  protanopia(type: ColorBlindnessType.protanopia, value: 5),
  deuteranopia(type: ColorBlindnessType.deuteranopia, value: 6),
  tritanopia(type: ColorBlindnessType.tritanopia, value: 7),
  achromatopsia(type: ColorBlindnessType.achromatopsia, value: 8),
  achromatomaly(type: ColorBlindnessType.achromatomaly, value: 9);

  final double value;
  final ColorBlindnessType type;

  const BlindnessType({
    required this.value,
    required this.type,
  });

  static BlindnessType fromValue(final double value) => switch (value) {
        1 => BlindnessType.none,
        2 => BlindnessType.protanomaly,
        3 => BlindnessType.deuteranomaly,
        4 => BlindnessType.tritanomaly,
        5 => BlindnessType.protanopia,
        6 => BlindnessType.deuteranopia,
        7 => BlindnessType.tritanopia,
        8 => BlindnessType.achromatopsia,
        9 => BlindnessType.achromatomaly,
        _ => BlindnessType.none,
      };
}
