import 'package:flutter/material.dart';
import 'package:sabka_kirana/presentation/widgets/otp_box_widget/widgets/circle_progress_widget/circle_progress_widget.dart';

import '../../otp_widget_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class OtpTimerWidget extends StatelessWidget {
  const OtpTimerWidget({
    Key key,
    @required bool isTimerRunning,
    @required double circleProgressValue,
    @required int secondCounter,
    @required Function onPressedResendButton,
    bool isTextTimeWhite = false,
    bool isButtonSendCodeYellow = false,
    bool shouldUppercaseResendTitle,
  })  : _isTimerRunning = isTimerRunning,
        _circleProgressValue = circleProgressValue,
        _secondCounter = secondCounter,
        _onPressedResendButton = onPressedResendButton,
        _isTextTimeWhite = isTextTimeWhite,
        _isButtonSendCodeYellow = isButtonSendCodeYellow,
        _shouldUppercaseResendTitle = shouldUppercaseResendTitle ?? true,
        super(key: key);

  final bool _isTimerRunning;
  final double _circleProgressValue;
  final int _secondCounter;
  final Function _onPressedResendButton;
  final bool _isTextTimeWhite;
  final bool _isButtonSendCodeYellow;
  final bool _shouldUppercaseResendTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: _isTimerRunning
          ? CircleProgressWidget(
              progressValue: _circleProgressValue,
              timeString: prepareTimeText(_secondCounter),
              textWhite: _isTextTimeWhite,
            )
          : Container(
              height: 30,
              child: FlatButton(
                key: const ValueKey(OtpWidgetConstants.resendBtnKey),
                color: _isButtonSendCodeYellow
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                onPressed: _onPressedResendButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: OtpWidgetConstants.resendPaddingTop.h),
                  child: Text(
                    _shouldUppercaseResendTitle ? 'RESEND' : 'Resend',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ),
            ),
    );
  }

  String prepareTimeText(int second) {
    final int minutes = second ~/ 60;
    final int seconds = second - minutes * 60;

    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = seconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }
}
