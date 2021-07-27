import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/icon_constants.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/category_section/category_section.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/search_bar/search_bar.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/store_section/store_item_section.dart';

const stores = [
  {
    "image": IconConstants.store1,
    "name": "Patel Stores",
    "rest": "Powai",
    "rating": "4.5 (164)",
  },
  {
    "image": IconConstants.store2,
    "name": "Munna Stores",
    "rest": "Thane",
    "rating": "3 (200)",
  },
  {
    "image": IconConstants.store3,
    "name": "Anna Stores",
    "rest": "Gatkopar",
    "rating": "4 (123)",
  },
  {
    "image": IconConstants.store4,
    "name": "Laxmi Stores",
    "rest": "Panvel",
    "rating": "2.5 (143)",
  },
  {
    "image": IconConstants.store5,
    "name": "Shree General Stores",
    "rest": "Matunga",
    "rating": "4 (163)",
  },
  {
    "image": IconConstants.store6,
    "name": "Mox Stores",
    "rest": "Mumbai central",
    "rating": "3.4 (150)",
  },
  {
    "image": IconConstants.store7,
    "name": "Minaxi Stores",
    "rest": "Bandra",
    "rating": "3.4 (100)",
  },
  {
    "image": IconConstants.store8,
    "name": "Ahmed Stores",
    "rest": "Kurla",
    "rating": "4 (500)",
  },
];

const CATEGORIES = [
  {"image": IconConstants.bakery, "name": "Bakery"},
  {"image": IconConstants.beverages, "name": "Beverages"},
  {"image": IconConstants.dairy, "name": "Dairy"},
  {"image": IconConstants.fruits, "name": "Fruits"},
  {"image": IconConstants.oil, "name": "Oil & Ghee"},
  {"image": IconConstants.meat, "name": "Fish & Meat"},
];

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardScreenState();
  }
}

class DashBoardScreenState extends State<DashboardScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        body: _getBody(textTheme),
        bottomNavigationBar: _getBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar _getBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).accentColor,
      currentIndex: 2,
      elevation: 2.0,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedFontSize: 18,
      fixedColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'orders'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), label: 'Category'),
        BottomNavigationBarItem(
            icon: Icon(Icons.share_rounded), label: 'Marketing'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Profile'),
      ],
    );
  }

  LayoutBuilder _getBody(TextTheme textTheme) => LayoutBuilder(
      builder: (context, constraints) => Container(
            child: Column(
              children: [
                _getHeaderContainer(textTheme),
                _getMainContainer(constraints, textTheme, context)
              ],
            ),
          ));

  Expanded _getHeaderContainer(TextTheme textTheme) => Expanded(
        flex: 2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _getBackgroundColor(),
            _getHeaderWidget(textTheme),
          ],
        ),
      );

  Container _getBackgroundColor() => Container(
        color: Theme.of(context).primaryColor,
      );

  Padding _getHeaderWidget(TextTheme textTheme) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchBar(focusNode: _focusNode),
            addVerticalSpace(10),
          ],
        ),
      );

  Widget _getMainContainer(BoxConstraints constraints, TextTheme textTheme,
          BuildContext context) =>
      Expanded(
        flex: 6,
        child: Container(
          width: constraints.maxWidth,
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                StoresItemSection(
                  stores: stores,
                  constraints: constraints,
                  focusNode: _focusNode,
                ),
                CategorySection(
                  constraints: constraints,
                  categories: CATEGORIES,
                ),
              ],
            ),
          ),
        ),
      );
}
