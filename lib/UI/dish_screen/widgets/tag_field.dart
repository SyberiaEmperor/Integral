import 'package:flutter/material.dart';

class TagField extends StatelessWidget {
  final String tag;

  const TagField(this.tag);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8),
      child: Container(
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          tag,
          style: Theme.of(context).accentTextTheme.subtitle1,
          textWidthBasis: TextWidthBasis.parent,
        ),
      ),
    );
  }
}
