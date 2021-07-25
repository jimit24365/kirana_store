import 'package:flutter/material.dart';
import 'package:kirana_store/presentation/journey/onboarding/login/onboarding_routes.dart';
import 'package:kirana_store/presentation/journey/splash/splash_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
        ...SplashRoutes.getAll(),
        ...OnboardingRoutes.getAll(),
      };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
