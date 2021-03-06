import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class Search extends StatelessWidget {
  final Function onEditingComplete;

  final TextEditingController controller;

  const Search({Key key, this.onEditingComplete, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: ResponsiveSize.width(15),
        left: ResponsiveSize.width(15),
      ),
      width: ResponsiveSize.width(345),
      height: ResponsiveSize.height(45),
      child: TextField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              ResponsiveSize.height(5),
            ),
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(
                right: ResponsiveSize.width(15),
                left: ResponsiveSize.width(11)),
            child: Icon(
              Icons.search,
              color: Theme.of(context).textSelectionTheme.cursorColor,
            ),
          ),
          hintText: 'Поиск',
          hintStyle: Theme.of(context).accentTextTheme.bodyText1,
          fillColor: Theme.of(context).primaryColor,
          filled: true,
        ),
      ),
    );
  }
}
