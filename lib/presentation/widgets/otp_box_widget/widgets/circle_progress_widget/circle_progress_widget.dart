import 'package:flutter/material.dart';

class CircleProgressWidget extends StatefulWidget {
  final double progressValue;
  final String timeString;
  final bool textWhite;

  CircleProgressWidget(
      {Key key, this.progressValue, this.timeString, this.textWhite = false})
      : super(key: key);

  @override
  _CircleProgressWidgetState createState() => _CircleProgressWidgetState();
}

class _CircleProgressWidgetState extends State<CircleProgressWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            value: widget.progressValue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            child: Text(
              widget.timeString,
              style: Theme.of(context).textTheme.subhead.copyWith(
                  color: widget.textWhite
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
          width: 20.0,
        ),
      ],
    );
  }
}
