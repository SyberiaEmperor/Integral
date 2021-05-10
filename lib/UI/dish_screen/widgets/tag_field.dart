import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class TagField extends StatelessWidget {
  final String tag;

  const TagField(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.height,
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
            .copyWith(fontSize: 10.height),
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}
