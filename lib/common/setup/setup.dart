import 'package:flutter/widgets.dart';

class Setup {
  void setupWidgetBinding() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  void init() {
    setupWidgetBinding();
  }
}
