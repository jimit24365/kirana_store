import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabka_kirana/presentation/app.dart';

import 'common/libraries/logger/logger.dart';
import 'common/setup/setup.dart';

void main() async {
  Setup().init();
  runZonedGuarded(
    () {
      runApp(App());
    },
    (
      dynamic error,
      dynamic stack,
    ) {
      LOG.e(
        '[Gaurded Error Catch]',
        error,
        stack,
      );
    },
  );
}
