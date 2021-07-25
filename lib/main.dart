import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kirana_store/common/libraries/logger/logger.dart';
import 'package:kirana_store/common/setup/setup.dart';
import 'package:kirana_store/presentation/app.dart';

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
