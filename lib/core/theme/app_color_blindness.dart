// import 'dart:ui';

import 'package:flutter/material.dart';

/// The color blindness types.
/// Type [none] is included as a convenience.
enum ColorBlindnessType {
  none,
  protanomaly,
  deuteranomaly,
  tritanomaly,
  protanopia,
  deuteranopia,
  tritanopia,
  achromatopsia,
  achromatomaly,
}

/// Simulates color blindness in a single color.
/// Input: a [Color] and a [ColorBlindnessType]
/// Output: the simulated [Color]
///
/// e

Color colorBlindness(Color color, ColorBlindnessType type) {
  switch (type) {
    case ColorBlindnessType.none:
      return color;
    case ColorBlindnessType.protanomaly:
      return protanomaly(color);
    case ColorBlindnessType.deuteranomaly:
      return deuteranomaly(color);
    case ColorBlindnessType.tritanomaly:
      return tritanomaly(color);
    case ColorBlindnessType.protanopia:
      return protanopia(color);
    case ColorBlindnessType.deuteranopia:
      return deuteranopia(color);
    case ColorBlindnessType.tritanopia:
      return tritanopia(color);
    case ColorBlindnessType.achromatopsia:
      return achromatopsia(color);
    case ColorBlindnessType.achromatomaly:
      return achromatomaly(color);
    default:
      // this should never be called.
      return const Color(0x00000000);
  }
}

ColorScheme colorBlindnessColorScheme(
  ColorScheme scheme,
  ColorBlindnessType type,
) =>
    ColorScheme(
      primary: colorBlindness(scheme.primary, type),
      onPrimary: colorBlindness(scheme.onPrimary, type),
      primaryContainer: colorBlindness(scheme.primaryContainer, type),
      onPrimaryContainer: colorBlindness(scheme.onPrimaryContainer, type),
      secondary: colorBlindness(scheme.secondary, type),
      onSecondary: colorBlindness(scheme.onSecondary, type),
      secondaryContainer: colorBlindness(scheme.secondaryContainer, type),
      onSecondaryContainer: colorBlindness(scheme.onSecondaryContainer, type),
      tertiary: colorBlindness(scheme.tertiary, type),
      onTertiary: colorBlindness(scheme.onTertiary, type),
      tertiaryContainer: colorBlindness(scheme.tertiaryContainer, type),
      onTertiaryContainer: colorBlindness(scheme.onTertiaryContainer, type),
      error: colorBlindness(scheme.error, type),
      onError: colorBlindness(scheme.onError, type),
      errorContainer: colorBlindness(scheme.errorContainer, type),
      onErrorContainer: colorBlindness(scheme.onErrorContainer, type),
      background: colorBlindness(scheme.background, type),
      onBackground: colorBlindness(scheme.onBackground, type),
      surface: colorBlindness(scheme.surface, type),
      surfaceVariant: colorBlindness(scheme.surfaceVariant, type),
      onSurface: colorBlindness(scheme.onSurface, type),
      onSurfaceVariant: colorBlindness(scheme.onSurfaceVariant, type),
      outline: colorBlindness(scheme.outline, type),
      shadow: colorBlindness(scheme.shadow, type),
      inverseSurface: colorBlindness(scheme.inverseSurface, type),
      onInverseSurface: colorBlindness(scheme.onInverseSurface, type),
      inversePrimary: colorBlindness(scheme.inversePrimary, type),
      brightness: scheme.brightness,
    );

/// Converted to Dart from: https://github.com/jordidekock/Colorblinds

/// Malfunctioning green.
Color deuteranomaly(Color color) {
  final double r = (color.red * 0.80) + (color.green * 0.20) + (color.blue * 0);
  final double g =
      (color.red * 0.25833) + (color.green * 0.74167) + (color.blue * 0);
  final double b =
      (color.red * 0.0) + (color.green * 0.14167) + (color.blue * 0.85833);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Missing red.
Color protanopia(Color color) {
  final double r =
      (color.red * 0.56667) + (color.green * 0.43333) + (color.blue * 0);
  final double g =
      (color.red * 0.55833) + (color.green * 0.44167) + (color.blue * 0);
  final double b =
      (color.red * 0.0) + (color.green * 0.24167) + (color.blue * 0.75833);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Missing green.
Color deuteranopia(Color color) {
  final double r =
      (color.red * 0.625) + (color.green * 0.375) + (color.blue * 0);
  final double g = (color.red * 0.7) + (color.green * 0.3) + (color.blue * 0);
  final double b = (color.red * 0.0) + (color.green * 0.3) + (color.blue * 0.7);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Malfunctioning red.
Color protanomaly(Color color) {
  final double r =
      (color.red * 0.81667) + (color.green * 0.18333) + (color.blue * 0);
  final double g =
      (color.red * 0.33333) + (color.green * 0.66667) + (color.blue * 0);
  final double b =
      (color.red * 0.0) + (color.green * 0.125) + (color.blue * 0.875);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Missing blue.
Color tritanopia(Color color) {
  final double r = (color.red * 0.95) + (color.green * 0.05) + (color.blue * 0);
  final double g =
      (color.red * 0.0) + (color.green * 0.43) + (color.blue * 0.56);
  final double b =
      (color.red * 0.0) + (color.green * 0.4755) + (color.blue * 0.525);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Malfunctioning blue.
Color tritanomaly(Color color) {
  final double r =
      (color.red * 0.9667) + (color.green * 0.033) + (color.blue * 0);
  final double g =
      (color.red * 0.0) + (color.green * 0.733) + (color.blue * 0.2667);
  final double b =
      (color.red * 0.0) + (color.green * 0.183) + (color.blue * 0.8167);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Less severe form of total color blind (monochromatic).
Color achromatomaly(Color color) {
  final double r =
      (color.red * 0.618) + (color.green * 0.32) + (color.blue * 0.062);
  final double g =
      (color.red * 0.163) + (color.green * 0.775) + (color.blue * 0.062);
  final double b =
      (color.red * 0.163) + (color.green * 0.32) + (color.blue * 0.516);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}

/// Totally color blind (monochromatic).
Color achromatopsia(Color color) {
  final double r =
      (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);
  final double g =
      (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);
  final double b =
      (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);

  return Color.fromARGB(255, r.round(), g.round(), b.round());
}
