import 'package:flutter/material.dart';
import 'package:kirana_store/presentation/journey/onboarding/login/login.dart';
import 'package:kirana_store/common/libraries/screen_utils/screen_utils.dart';

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
    animationController = new AnimationController(
        duration: Duration(seconds: 3), vsync: this)
      ..fling()
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              fullscreenDialog: true,
              transitionDuration: Duration(milliseconds: 400),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondAnimation) => Login(),
            ),
          );
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/icons/store_white.png',
                    height: 200.h,
                  ),
                ),
                Hero(
                  tag: 'title',
                  child: Text(
                    'Sabka Kirana',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
