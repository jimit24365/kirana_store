import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabka_kirana/common/constants/icon_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class PhonePrefixIcon extends StatelessWidget {
  const PhonePrefixIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 3.h),
          child: Image.asset(
            IconConstants.indianFlag,
            height: 40.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 3),
          child: Text(
            '+91',
            style: Theme.of(context).textTheme.headline6.copyWith(height: 1.5),
          ),
        )
      ],
    );
  }
}
