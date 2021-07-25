import 'package:flutter/material.dart';
import 'package:kirana_store/common/constants/route_constants.dart';
import 'package:kirana_store/presentation/journey/splash/splash_screen.dart';

class SplashRoutes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteList.splash: (context) => const SplashScreen(),
      };
}
