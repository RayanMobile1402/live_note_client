import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../core/parameters/local_storage_key.dart';
import '../../core/parameters/parameters.dart';
import '../../core/router/app_route_names.dart';
import '../../core/theme/controller/theme_controller.dart';
import '../../core/theme/dark_theme.dart';
import '../../core/theme/light_theme.dart';
import '../../core/theme/theme_type.dart';
import '../../core/utils/font_util.dart';
import '../../core/utils/utils.dart';
import '../models/blindness_type.dart';

class CustomDrawer extends GetView<ThemeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Drawer(
          width: 300,
          child: ListView(
            children: [
              Utils.largeVerticalSpacer,
              Center(
                child: _fontSizeSlider(
                  current: controller.currentFontSliderValue.value,
                  onChanged: controller.changeFontSize,
                ),
              ),
              Utils.largeVerticalSpacer,
              Center(
                child: _blindnessTypeSlider(
                  current: controller.currentBlindnessType.value,
                  onChanged: controller.changeColorBlindnessType,
                ),
              ),
              Utils.largeVerticalSpacer,
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile<FontEnum>(
                        value: FontEnum.quickSand,
                        title: const Text('quicksand'),
                        groupValue: controller.fontUtil.value.font.value,
                        onChanged: (final value) {
                          controller.changeFontFamily(value!);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<FontEnum>(
                        value: FontEnum.athene,
                        title: const Text('inter'),
                        groupValue: controller.fontUtil.value.font.value,
                        onChanged: (final value) {
                          controller.changeFontFamily(value!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Utils.mediumVerticalSpacer,
              const NiceText('App Theme'),
              Utils.mediumVerticalSpacer,
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        value: ThemeType.light,
                        title: const Text('Light'),
                        groupValue: controller.currentThemeType.value,
                        onChanged: (final value) {
                          controller.changeAppTheme(
                              LightTheme(controller.currentBlindnessType.value.type));
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        value: ThemeType.dark,
                        title: const Text('Dark'),
                        groupValue: controller.currentThemeType.value,
                        onChanged: (final value) {
                          controller.changeAppTheme(
                              DarkTheme(controller.currentBlindnessType.value.type));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Utils.mediumVerticalSpacer,
              const Divider(),
              ListTile(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove(LocalStorageKey.refreshToken);
                  await prefs.remove(LocalStorageKey.apiToken);
                  Parameters.refreshToken = null;
                  Parameters.accessToken = null;
                  Parameters.accessTokenExpirationDateTime = null;
                  Parameters.roles.clear();

                  await Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(
                    AppRouteNames.login,
                  );
                },
                leading: const Icon(Icons.arrow_circle_left_sharp),
                title: const NiceText('Sign out'),
              ),
            ],
          ),
        ),
      );

  Widget _fontSizeSlider({
    required final double current,
    required final void Function(double value) onChanged,
  }) =>
      SfSlider(
        min: 1.0,
        max: 5.0,
        value: current,
        interval: 1,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 0,
        stepSize: 1,
        onChanged: (dynamic value) {
          onChanged.call(value);
        },
      );

  Widget _blindnessTypeSlider({
    required final BlindnessType current,
    required final void Function(BlindnessType item) onChanged,
  }) =>
      SfSlider(
        min: 1.0,
        max: 9.0,
        value: current.value,
        interval: 1,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 0,
        stepSize: 1,
        onChanged: (dynamic value) {
          onChanged.call(BlindnessType.fromValue(value));
        },
      );
}
