import 'package:flutter/material.dart';
import 'package:integral/resources/app_strings.dart';

///Shows circled loader.
class LoaderWidget extends StatelessWidget {
  ///Color of spinning circle
  final Color color;

  const LoaderWidget({Key key, @required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;
        var circleSize =
            (width > height ? height : width) * 0.3; // 0.3 of the smallest
        return Container(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: circleSize,
                width: circleSize,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  strokeWidth: 5.0,
                ),
              ),
              Text(AppLabelStrings.LOADER_LABEL),
            ],
          ),
        );
      },
    );
  }
}
