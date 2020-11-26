import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

class Categories extends StatefulWidget {
  final selectedCategory;
  final List<Category> categories;

  const Categories(this.categories, {Key key, this.selectedCategory = 0})
      : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int current;

  @override
  void initState() {
    current = widget.selectedCategory;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(width: ResponsiveSize.width(24)),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.categories.length + 2,
          itemBuilder: (context, index) {
            if (index == 0 || index == widget.categories.length + 1)
              return SizedBox(
                width: ResponsiveSize.width(6),
              );

            return GestureDetector(
              onTap: () {
                current = index - 1;
                setState(() {});
              },
              child: Container(
                height: ResponsiveSize.height(47),
                child: Center(
                  child: Text(
                    widget.categories[index - 1].asString,
                    style: (current == index - 1)
                        ? theme.accentTextTheme.bodyText2
                        : theme.accentTextTheme.bodyText1,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
