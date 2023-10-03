import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_note_authentication/feature/authemtication_mian.dart';
import 'package:live_note_authentication/feature/role_type.dart';

import 'core/router/app_route_names.dart';
import 'core/router/app_router.dart';
import 'core/theme/controller/theme_controller.dart';

void main() {
  Get.lazyPut(
    ThemeController.new,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeController get controller => Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => GetMaterialApp(
          title: 'Flutter Demo',
          theme: controller.baseTheme.value!
              .createTheme(controller.fontUtil.value),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouteNames.splash,
          home: const AutheticationMain(
            roleType: RoleType.client,
          ),
        ),
      );
}
