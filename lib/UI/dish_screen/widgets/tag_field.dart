import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class TagField extends StatelessWidget {
  final String tag;

  const TagField(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        tag,
        style: Theme.of(context)
            .accentTextTheme
            .subtitle1
            .copyWith(fontSize: 12.height),
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}
