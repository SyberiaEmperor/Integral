import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class Categories extends StatelessWidget {
  final selectedCategory;

  const Categories({Key key, this.selectedCategory = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.values;
    var theme = Theme.of(context);

    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(width: ResponsiveSize.width(84)),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              height: ResponsiveSize.height(47),
              width: ResponsiveSize.width(20),
              child: Text(
                categories[index].asString,
                style: (selectedCategory == index)
                    ? theme.primaryTextTheme.bodyText1
                    : theme.accentTextTheme.bodyText1,
              ),
            );
          }),
    );
  }
}
