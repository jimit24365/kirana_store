import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';

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
        top: -40,
        left: 0,
        child: Container(
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxWidth * 0.35,
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
        margin: const EdgeInsets.only(right: 10.0),
        width: constraints.maxWidth * 0.25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 4, child: Image.asset(category['image'])),
              addVerticalSpace(30),
              Text(
                category['name'],
                style: textTheme.subtitle1?.apply(color: Colors.black),
              ),
            ],
          ),
        ),
      );
}
