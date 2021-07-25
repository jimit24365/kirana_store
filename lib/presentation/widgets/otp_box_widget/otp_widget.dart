import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sabka_kirana/presentation/widgets/otp_box_widget/widgets/code_box_widget/code_box_widget.dart';
import 'package:sabka_kirana/presentation/widgets/otp_box_widget/widgets/otp_timer/otp_timer_widget.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

import 'otp_widget_constants.dart';

class OtpWidget extends StatefulWidget {
  final String title;
  final bool shouldUppercaseResendTitle;
  final Color titleColor;
  final Color iconColor;
  final Color codeBorderColor;
  final Color inValidBoxColor;
  final Color backgroundColorForCodeBox;
  final bool autoFocus;
  final bool Function(String) validator;
  final void Function(String Text) onChanged;
  final TextEditingController textController;
  final Function onPressedResendButton;
  final Function(String Text) onFinishInput;
  final int secondsNumber;
  final bool showOtpTimer;
  final bool yellowMode;

  OtpWidget({
    Key key,
    @required this.title,
    @required this.titleColor,
    @required this.iconColor,
    @required this.codeBorderColor,
    @required this.textController,
    this.shouldUppercaseResendTitle,
    this.inValidBoxColor,
    this.validator,
    this.onChanged,
    this.backgroundColorForCodeBox,
    this.autoFocus = true,
    this.onPressedResendButton,
    this.onFinishInput,
    this.secondsNumber = OtpWidgetConstants.defaultSecondsNumber,
    this.showOtpTimer = true,
    this.yellowMode = false,
  }) : super(key: key);

  @override
  OtpWidgetState createState() => OtpWidgetState();
}

class OtpWidgetState extends State<OtpWidget> {
  final _focusNode = FocusNode();
  bool _isValid;
  bool _isTimerRunning;
  double _circleProgressValue;
  int _secondCounter;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _isTimerRunning = false;
    _circleProgressValue = 1.0;
    _secondCounter = widget.secondsNumber;
    if (widget.showOtpTimer && !_isTimerRunning) {
      _isTimerRunning = true;
      _updateProgress();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: OtpWidgetConstants.opacityValue,
            child: TextField(
              key: const ValueKey(OtpWidgetConstants.invisibleTextFieldKey),
              autofocus: widget.autoFocus,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              focusNode: _focusNode,
              maxLength: OtpWidgetConstants.digitNumberLimit,
              controller: widget.textController,
              onChanged: _onChangedText,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: OtpWidgetConstants.containerWidth,
                  ),
                  Icon(
                    Icons.lock,
                    color: widget.iconColor,
                    size: OtpWidgetConstants.iconSize,
                  ),
                  Container(
                    width: OtpWidgetConstants.iconContainerWidth,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme.headline5,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: OtpWidgetConstants.paddingHorizontal,
                  right: OtpWidgetConstants.paddingHorizontal,
                  top: OtpWidgetConstants.paddingTop,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(
                    OtpWidgetConstants.digitNumberLimit,
                    (int index) => CodeBoxWidget(
                      codeBorderColor: _prepareCodeBorderColor(),
                      onBoxPressed: () {
                        _onBoxPressed(index);
                      },
                      text: _prepareCodeString(index),
                      backgroundColor:
                          widget.backgroundColorForCodeBox ?? Colors.white,
                    ),
                  ),
                ),
              ),
              if (widget.showOtpTimer)
                Padding(
                  padding: EdgeInsets.only(top: 23.h),
                  child: OtpTimerWidget(
                      shouldUppercaseResendTitle:
                          widget.shouldUppercaseResendTitle,
                      onPressedResendButton: _onPressedResendButtonCb,
                      isTimerRunning: _isTimerRunning,
                      circleProgressValue: _circleProgressValue,
                      secondCounter: _secondCounter,
                      isTextTimeWhite: widget.yellowMode,
                      isButtonSendCodeYellow: !widget.yellowMode),
                )
            ],
          )
        ],
      ),
    );
  }

  Color _prepareCodeBorderColor() {
    if (_isValid == null || _isValid == true) {
      return widget.codeBorderColor;
    }
    return widget.inValidBoxColor ?? Colors.red;
  }

  void _onChangedText(String text) {
    if (widget.onChanged != null) {
      widget.onChanged(text);
    } else {
      //Rebuild widget to show inputted value
      setState(() {});
    }
    if (text.length == OtpWidgetConstants.digitNumberLimit) {
      widget.onFinishInput?.call(text);
      if (widget.validator != null) {
        setState(() {
          _isValid = widget.validator(text);
        });
      }
    }
  }

  void _onBoxPressed(int index) {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  String _prepareCodeString(int index) =>
      (widget.textController.text.length > index)
          ? widget.textController.text[index]
          : '';

  void _onPressedResendButtonCb() {
    if (!_isTimerRunning) {
      widget.onPressedResendButton?.call();
      setState(() {
        _isTimerRunning = true;
      });
      _updateProgress();
    }
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (Timer t) {
      _secondCounter -= 1;
      setState(() {
        _circleProgressValue -= 1 / widget.secondsNumber;
        if (_secondCounter == 0) {
          t.cancel();
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
    setState(() {
      _secondCounter = widget.secondsNumber;
      _isTimerRunning = false;
      _circleProgressValue = 1.0;
    });
  }
}
