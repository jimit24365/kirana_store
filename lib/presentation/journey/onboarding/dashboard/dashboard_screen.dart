import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_kirana/common/constants/color_constants.dart';
import 'package:sabka_kirana/common/constants/icon_constants.dart';
import 'package:sabka_kirana/common/utils/widget_utils.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/product_item.dart';

const PRODUCT_DATA = [
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

  Container _getBackgroundColor() {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }

  Padding _getHeaderWidget(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getSearchBarWidget(),
          addVerticalSpace(10),
        ],
      ),
    );
  }

  Widget _getMainContainer(
      BoxConstraints constraints, TextTheme textTheme, BuildContext context) {
    return Expanded(
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
              _getFoodItemSection(constraints, textTheme, context),
              _getCategorySection(constraints, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  TextField _getSearchBarWidget() {
    return TextField(
      focusNode: _focusNode,
      cursorColor: Colors.white,
      cursorRadius: Radius.circular(10.0),
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Search Food Items",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: Colors.white24),
    );
  }

  Column _getFoodItemSection(
      BoxConstraints constraints, TextTheme textTheme, BuildContext context) {
    return Column(
      children: [
        addVerticalSpace(constraints.maxWidth * 0.35),
        _getFoodItemHeaderWidget(textTheme),
        addVerticalSpace(10),
        _getFoodItemWidgetList(context, constraints),
      ],
    );
  }

  Row _getFoodItemHeaderWidget(TextTheme textTheme) {
    return Row(
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
  }

  SingleChildScrollView _getFoodItemWidgetList(
          BuildContext context, BoxConstraints constraints) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: PRODUCT_DATA
              .map((data) => InkWell(
                    onTap: () {
                      _focusNode.unfocus();
                      /* Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(productData: data)));*/
                    },
                    child: ProductItem(
                      width: constraints.maxWidth * 0.40,
                      productData: data,
                    ),
                  ))
              .toList(),
        ),
      );

  Positioned _getCategorySection(
          BoxConstraints constraints, TextTheme textTheme) =>
      Positioned(
        top: -40,
        left: 0,
        child: Container(
          width: constraints.maxWidth,
          height: constraints.maxWidth * 0.35,
          child: _getCategoryRow(constraints, textTheme),
        ),
      );

  ListView _getCategoryRow(BoxConstraints constraints, TextTheme textTheme) =>
      ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: CATEGORIES
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
