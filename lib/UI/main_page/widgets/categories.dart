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
              SizedBox(width: ResponsiveSize.width(24)),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0)
              return SizedBox(
                width: ResponsiveSize.width(6),
              );

            return Container(
              height: ResponsiveSize.height(47),
              child: Center(
                child: Text(
                  categories[index - 1].asString,
                  style: (selectedCategory == index - 1)
                      ? theme.accentTextTheme.bodyText2
                      : theme.accentTextTheme.bodyText1,
                ),
              ),
            );
          }),
    );
  }
}
