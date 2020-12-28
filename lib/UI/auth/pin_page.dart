import 'package:flutter/material.dart';
import 'package:integral/UI/auth/widgets/pin_input_field.dart';

class PinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinInputField(),
      ],
    ));
  }
}
