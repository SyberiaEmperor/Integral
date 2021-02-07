import 'package:flutter/material.dart';
import 'package:integral/UI/auth/widgets/pin_input_field.dart';

class PinPage extends StatelessWidget {
  final PinController controller;

  const PinPage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pin4SymInputField(controller),
      ],
    ));
  }
}
