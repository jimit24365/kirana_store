import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool half;

  const PrimaryButton({
    Key key,
    this.text,
    this.onTap,
    this.half,
  }) : super(key: key);

  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: 10,
      );

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: onTap != null ? 1 : 0.5,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: _padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.center,
            height: 48.h,
            width: 374.w,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      );
}
