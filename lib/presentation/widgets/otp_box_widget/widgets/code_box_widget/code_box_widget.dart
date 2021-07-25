import 'package:flutter/material.dart';

import 'code_box_widget_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class CodeBoxWidget extends StatelessWidget {
  final void Function() onBoxPressed;
  final String text;
  final Color codeBorderColor;
  final Color backgroundColor;

  const CodeBoxWidget({
    Key key,
    @required this.codeBorderColor,
    @required this.onBoxPressed,
    @required this.text,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CodeBoxWidgetConstants.containerPadding.h),
      child: GestureDetector(
        onTap: onBoxPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius:
                BorderRadius.circular(CodeBoxWidgetConstants.borderRadius),
            border: Border.all(
                width: CodeBoxWidgetConstants.boxBorderWidth,
                color: codeBorderColor),
          ),
          alignment: Alignment.center,
          width: CodeBoxWidgetConstants.boxWidth.w,
          height: CodeBoxWidgetConstants.boxHeight.w,
          child: Padding(
            padding: EdgeInsets.only(
                top: CodeBoxWidgetConstants.gestureDetectorPaddingtop.h),
            child: Text(
              text,
              style: Theme.of(context).textTheme.display3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
