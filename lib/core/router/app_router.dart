import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_note_authentication/live_note_authentication.dart';
import '../../pages/home_page/views/home_page.dart';
import 'app_route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        AppRouteNames.home => MaterialPageRoute(
          builder: (final _) {
            return const HomePage();
          },
        ),
        AppRouteNames.splash => AuthenticationAppRouter.getSplash(settings),
        AppRouteNames.loginBiometric =>
            AuthenticationAppRouter.getLoginBiometric(settings),
        AppRouteNames.login => AuthenticationAppRouter.getLogin(settings),
        AppRouteNames.verifyEmail => AuthenticationAppRouter.getVerifyEmail(settings),
        AppRouteNames.resetPassword => AuthenticationAppRouter.getResetPassword(settings),
        AppRouteNames.forgotPassword=> AuthenticationAppRouter.getForgotPassword(settings),

        _ => MaterialPageRoute(
          builder: (final _) => const HomePage(),
        ),
      };
}
