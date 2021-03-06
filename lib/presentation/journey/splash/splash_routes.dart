import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/route_constants.dart';
import 'package:sabka_kirana/presentation/journey/splash/splash_screen.dart';

class SplashRoutes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteList.splash: (context) => const SplashScreen(),
      };
}
