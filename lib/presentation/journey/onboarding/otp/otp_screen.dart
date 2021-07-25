import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/route_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';
import 'package:sabka_kirana/presentation/widgets/otp_box_widget/otp_widget.dart';

class OTPScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OTPScreenState();
  }
}

class OTPScreenState extends State<OTPScreen> {
  final validOTP = '123123';
  final otpThreshold = 6;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 300.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: OtpWidget(
                    title: 'Enter OTP',
                    titleColor: Colors.black,
                    iconColor: Colors.grey,
                    codeBorderColor: Theme.of(context).primaryColor,
                    textController: textEditingController,
                    autoFocus: true,
                    inValidBoxColor: Colors.redAccent,
                    validator: (value) {
                      if (value != null &&
                          value.length == otpThreshold &&
                          value != validOTP) {
                        return false;
                      }
                      return true;
                    },
                    onChanged: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length == otpThreshold &&
                          value == validOTP) {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteList.splash);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
