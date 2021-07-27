import 'package:flutter/material.dart';
import 'package:sabka_kirana/presentation/journey/onboarding/dashboard/widget/search_bar/search_bar_constants.dart';
import 'package:sabka_kirana/common/libraries/screen_utils/screen_utils.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required FocusNode focusNode,
  })  : _focusNode = focusNode,
        super(key: key);

  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      cursorColor: Colors.white,
      cursorRadius: Radius.circular(SearchBarConstants.borderRadius),
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: SearchBarConstants.placeHolder,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(SearchBarConstants.outLineBorderRadius),
              borderSide: BorderSide.none),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: Container(
            height: SearchBarConstants.iconContainerHeight.h,
            width: SearchBarConstants.iconContainerHeight.w,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.only(
                topRight:
                    Radius.circular(SearchBarConstants.outLineBorderRadius),
                bottomRight:
                    Radius.circular(SearchBarConstants.outLineBorderRadius),
              ),
            ),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: Colors.white24),
    );
  }
}
