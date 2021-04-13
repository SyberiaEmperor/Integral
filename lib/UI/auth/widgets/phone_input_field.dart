import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

import 'package:integral/services/responsive_size.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maskPhone = MaskedInputFormatter('(###)###-##-##',
        anyCharMatcher: RegExp(r'[0-9]'));

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSize.width(15),
          vertical: ResponsiveSize.height(ResponsiveSize.height(5))),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Color(0xddFA7022),
          primaryColor: Color(0xddFA7022),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          style: Theme.of(context)
              .accentTextTheme
              .bodyText2
              .copyWith(fontSize: 20),
          inputFormatters: [
            //FilteringTextInputFormatter.digitsOnly,
            maskPhone,
          ],
          decoration: InputDecoration(
            prefix: Text(
              '+7',
              style: Theme.of(context)
                  .accentTextTheme
                  .bodyText2
                  .copyWith(fontSize: 20),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
