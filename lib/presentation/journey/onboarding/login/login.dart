import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kirana_store/common/constants/icon_constants.dart';
import 'package:kirana_store/common/libraries/screen_utils/screen_utils.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: LayoutBuilder(
        builder: (context, constraints) => Container(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 100.h),
                              child: Hero(
                                tag: 'logo',
                                child: Image.asset(
                                  IconConstants.whiteLogo,
                                  height: 100.h,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Hero(
                                tag: 'title',
                                child: Text('Sabka Kirana',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.white,
                          height: 600.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}
