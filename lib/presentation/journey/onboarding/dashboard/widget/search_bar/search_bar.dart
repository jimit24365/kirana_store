import 'package:flutter/material.dart';

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
}