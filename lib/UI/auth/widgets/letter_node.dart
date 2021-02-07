import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integral/services/responsive_size.dart';

class LetterNode extends StatelessWidget {
  final FocusNode currentNode;
  final FocusNode nextNode;

  final TextEditingController controller;

  const LetterNode({this.currentNode, this.nextNode, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveSize.width(30),
      height: ResponsiveSize.height(80),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Color(0xddFA7022),
          primaryColor: Color(0xddFA7022),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          focusNode: currentNode,
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.isNotEmpty) {
              currentNode.unfocus();
              FocusScope.of(context).requestFocus(nextNode);
            }
          },
          style: Theme.of(context)
              .accentTextTheme
              .bodyText2
              .copyWith(fontSize: 25),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: InputDecoration(),
        ),
      ),
    );
  }
}
