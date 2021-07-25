import 'package:flutter/material.dart';
import 'otp_widget.dart';

class OtpWidgetStory {
  Widget storyContent(context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: OtpWidget(
            textController: TextEditingController(),
            title: 'OTP',
            codeBorderColor: Theme.of(context).primaryColor,
            iconColor: Colors.white,
            titleColor: Colors.black,
            autoFocus: false,
          ),
        ),
      );
}
