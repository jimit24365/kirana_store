import 'package:flutter/material.dart';

import 'journey/onboarding/onboarding_routes.dart';
import 'journey/splash/splash_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
        ...SplashRoutes.getAll(),
        ...OnboardingRoutes.getAll(),
      };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
