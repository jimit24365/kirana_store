import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/route_constants.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/dashboard_screen.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/otp/otp_screen.dart';

import 'login/login_screen.dart';

class OnboardingRoutes {
  static Map<String, WidgetBuilder> getAll() => {
        RouteList.login: (context) => LoginScreen(),
        RouteList.otp: (context) => OTPScreen(),
        RouteList.dashboard: (context) => DashboardScreen(),
      };
}
