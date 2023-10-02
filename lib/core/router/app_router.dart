import 'package:flutter/material.dart';
import '../../pages/home_page/views/home_page.dart';
import 'app_route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        AppRouteNames.home => MaterialPageRoute(
            builder: (final _) => const HomePage(),
          ),
        _ => MaterialPageRoute(
            builder: (final _) => const HomePage(),
          ),
      };
}
