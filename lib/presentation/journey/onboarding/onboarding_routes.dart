import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/route_constants.dart';

import 'login/login_screen.dart';

class OnboardingRoutes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteList.login: (context) => LoginScreen(),
      };
}
