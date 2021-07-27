import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/category_section/category_section_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class CategorySection extends StatefulWidget {
  final BoxConstraints constraints;
  final List<Map<String, String>> categories;

  CategorySection({Key key, this.constraints, this.categories})
      : super(key: key);

  // final List<Map<String,String>> categories;

  @override
  State<StatefulWidget> createState() {
    return CategorySectionState();
  }
}

class CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) => Positioned(
        top: CategorySectionConstants.containerTopPosition.h,
        left: CategorySectionConstants.containerLeftPosition.w,
        child: Container(
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxWidth *
              CategorySectionConstants.containerHeightMultiplier,
          child:
              _getCategoryRow(widget.constraints, Theme.of(context).textTheme),
        ),
      );

  ListView _getCategoryRow(BoxConstraints constraints, TextTheme textTheme) =>
      ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: widget.categories
            .map((category) =>
                _getCategoryItemWidget(constraints, category, textTheme))
            .toList(),
      );

  Container _getCategoryItemWidget(BoxConstraints constraints,
          Map<String, String> category, TextTheme textTheme) =>
      Container(
        margin: EdgeInsets.only(
            right: CategorySectionConstants.categoryItemMarginRight.w),
        width: constraints.maxWidth *
            CategorySectionConstants.containerWidthMultiplier,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
              CategorySectionConstants.containerBorderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(CategorySectionConstants.imagePadding),
          child: Column(
            children: [
              Expanded(
                  flex: CategorySectionConstants.assetFlex,
                  child: Image.asset(category['image'])),
              addVerticalSpace(CategorySectionConstants.imageVerticalSpace),
              Text(
                category['name'],
                style: textTheme.subtitle1?.apply(color: Colors.black),
              ),
            ],
          ),
        ),
      );
}
