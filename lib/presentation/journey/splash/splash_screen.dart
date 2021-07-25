import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/common_string_constant.dart';
import 'package:sabka_kirana/common/constants/icon_constants.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/login/login_screen.dart';
import 'package:sabka_kirana/presentation/journey/splash/splash_constant.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    _scheduleLoginScreenAnimation();
    super.initState();
  }

  AnimationController _scheduleLoginScreenAnimation() =>
      animationController = new AnimationController(
          duration:
              Duration(seconds: SplashScreenConstants.splashScreenDuration),
          vsync: this)
        ..fling()
        ..forward()
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              navigateToLoginScreen();
            }
          },
        );

  Future<dynamic> navigateToLoginScreen() => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          fullscreenDialog: true,
          transitionDuration: Duration(
              milliseconds:
                  SplashScreenConstants.splashToLoginTransitionTimeMilli),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondAnimation) => LoginScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getLogo(),
                _getAppTitle(),
              ],
            ),
          ),
        ),
      );

  Widget _getAppTitle() => Hero(
        tag: SplashScreenConstants.appTitleTag,
        child: Text(
          CommonStringConstant.appTitle,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.white),
        ),
      );

  Widget _getLogo() => Hero(
        tag: SplashScreenConstants.logoTag,
        child: Image.asset(
          IconConstants.whiteLogo,
          height: SplashScreenConstants.logoHeight.h,
        ),
      );
}
