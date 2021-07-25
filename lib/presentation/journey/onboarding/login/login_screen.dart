import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabka_kirana/common/constants/common_string_constant.dart';
import 'package:sabka_kirana/common/constants/icon_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/login/login_screen_constants.dart';
import 'package:sabka_kirana/presentation/widgets/phone_number_widget/phone_number_input_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TabController controller;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          _getHeaderWidget(context),
          _getLoginForm(),
        ],
      ));

  Padding _getLoginForm() => Padding(
        padding:
            EdgeInsets.only(top: LoginScreenConstants.headerContainerHeight.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              LoginScreenConstants.loginFormContainerBorderRadius),
          child: Container(
            color: Colors.white,
            height: LoginScreenConstants.loginFormContainerHeight.h,
            child: DefaultTabController(
              length: 2,
              initialIndex: 1,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        LoginScreenConstants.customerTabTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        LoginScreenConstants.storeTabTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    Icon(Icons.people),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 50.h),
                      child: PhoneNumberInputWidget(
                        textEditingController: phoneController,
                      ),
                    ),

                    // OtpWidgetStory().storyContent(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Container _getHeaderWidget(BuildContext context) => Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            children: [
              _getLogoWidget(),
              _getAppTitleWidget(context),
            ],
          ),
        ),
      );

  Padding _getAppTitleWidget(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: LoginScreenConstants.titlePaddingTop.h),
        child: Hero(
          tag: LoginScreenConstants.titleTag,
          child: Text(CommonStringConstant.appTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white)),
        ),
      );

  Padding _getLogoWidget() => Padding(
        padding: EdgeInsets.only(
            top: LoginScreenConstants.headerContainerLogoPaddingTop.h),
        child: Hero(
          tag: LoginScreenConstants.logoTag,
          child: Image.asset(
            IconConstants.whiteLogo,
            height: LoginScreenConstants.headerContainerLogoHeight.h,
          ),
        ),
      );
}
