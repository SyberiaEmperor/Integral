import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: InputBorder.none,
          prefixIcon: Container(
            width: 20,
            height: 20,
            child: Icon(Icons.search),
          ),
          hintText: "Поиск",
          hintStyle: Theme.of(context).accentTextTheme.bodyText1,
          fillColor: Theme.of(context).primaryColor,
          filled: true,
        ),
      ),
    );
  }
}
