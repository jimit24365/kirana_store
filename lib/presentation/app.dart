import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sabka_kirana/common/constants/layout_constants.dart';
import 'package:sabka_kirana/common/constants/route_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';
import 'package:sabka_kirana/presentation/routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor));
    return ScreenUtilsInit(
      designSize: const Size(
        LayoutConstants.designWidth,
        LayoutConstants.designHeight,
      ),
      builder: () => MaterialApp(
        title: 'Sabka Kirana',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.getAll(),
        initialRoute: RouteList.splash,
      ),
    );
  }
}
