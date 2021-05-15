import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class TagField extends StatelessWidget {
  final String tag;

  const TagField(this.tag);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.width, bottom: 8.height),
      child: Container(
        alignment: Alignment.center,
        height: 35.height,
        width: 125.width,
        padding: EdgeInsets.symmetric(horizontal: 18.width, vertical: 6.height),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          tag,
          style: Theme.of(context)
              .accentTextTheme
              .subtitle1
              .copyWith(fontSize: 11.height),
          textWidthBasis: TextWidthBasis.parent,
        ),
      ),
    );
  }
}
