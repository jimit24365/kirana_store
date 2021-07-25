import 'package:flutter/material.dart';
import 'package:kirana_store/common/constants/route_constants.dart';
import 'package:kirana_store/presentation/journey/onboarding/login/login.dart';

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
              transitionDuration: Duration(seconds: 3),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'title',
                child: Text(
                  'Sabka Kirana',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      );
}
