import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/color_constants.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/store_section/store_item.dart';

class StoresItemSection extends StatefulWidget {
  final List<Map<String, String>> stores;
  final FocusNode focusNode;
  final BoxConstraints constraints;

  const StoresItemSection(
      {Key key, this.stores, this.focusNode, this.constraints})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StoresItemSectionState();
  }
}

class StoresItemSectionState extends State<StoresItemSection> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          addVerticalSpace(widget.constraints.maxWidth * 0.35),
          getFoodItemHeaderWidget(Theme.of(context).textTheme),
          addVerticalSpace(10),
          getFoodItemWidgetList(context, widget.constraints),
        ],
      );

  Row getFoodItemHeaderWidget(TextTheme textTheme) => Row(
        children: [
          Text(
            "Stores Near You",
            style: textTheme.headline5,
          ),
          Expanded(
            child: Center(),
          ),
          Text(
            "View All > ",
            style: textTheme.subtitle2?.apply(color: COLOR_ORANGE),
          ),
          addHorizontalSpace(10),
        ],
      );

  SingleChildScrollView getFoodItemWidgetList(
          BuildContext context, BoxConstraints constraints) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: widget.stores
              .map((data) => InkWell(
                    onTap: () {
                      widget.focusNode.unfocus();
                    },
                    child: StoreItem(
                      width: constraints.maxWidth * 0.40,
                      storeItemData: data,
                    ),
                  ))
              .toList(),
        ),
      );
}
