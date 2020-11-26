import 'package:flutter/material.dart';

typedef _IncrementCallback = Function();
typedef _DecrementCallback = Function();

enum CountFieldAxis { horizontal, vertical }

class CountField extends StatelessWidget {
  final int count;
  final _IncrementCallback inc;
  final _DecrementCallback dec;
  final CountFieldAxis axis;
  final Color color;
  final EdgeInsets padding;

  const CountField.horizontal(
      {@required this.count,
      @required this.inc,
      @required this.dec,
      @required this.color,
      this.padding = const EdgeInsets.all(0.0)})
      : axis = CountFieldAxis.horizontal;
  const CountField.vertical(
      {@required this.count,
      @required this.inc,
      @required this.dec,
      @required this.color,
      this.padding = const EdgeInsets.all(0.0)})
      : axis = CountFieldAxis.vertical;

  @override
  Widget build(BuildContext context) {
    Widget add = GestureDetector(
      onTap: inc,
      child: Icon(Icons.add, size: 24, color: color),
    );
    Widget countField = Text(
      count.toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: 18,
      ),
    );
    Widget delete = GestureDetector(
      onTap: dec,
      child: Icon(
        Icons.remove,
        size: 24,
        color: color,
      ),
    );
    return axis == CountFieldAxis.vertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [add, countField, delete]
                .map((e) => Padding(
                      padding: padding,
                      child: e,
                    ))
                .toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [delete, countField, add]
                .map((e) => Padding(
                      padding: padding,
                      child: e,
                    ))
                .toList(),
          );
  }
}
