import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:integral/services/responsive_size.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'letter_node.dart';

class PhoneInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var maskPhone = MaskTextInputFormatter(mask: '(###)###-##-##');

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
          style: Theme.of(context)
              .accentTextTheme
              .bodyText2
              .copyWith(fontSize: 20),
          inputFormatters: [maskPhone],
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
