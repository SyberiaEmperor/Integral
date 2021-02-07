import 'package:flutter/material.dart';
import 'package:integral/UI/auth/widgets/letter_node.dart';

class Pin4SymInputField extends StatelessWidget {

  final PinController controller;

  final FocusNode first = FocusNode();
  final FocusNode second = FocusNode();
  final FocusNode third = FocusNode();
  final FocusNode fourth = FocusNode();

  Pin4SymInputField(this.controller,{Key key,}) : super(key: key)
  {
    if(controller.pinSymbols<4) throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LetterNode(
            controller: controller.controllers[0],
            currentNode: first,
            nextNode: second,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            controller: controller.controllers[1],
            currentNode: second,
            nextNode: third,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            controller: controller.controllers[2],
            currentNode: third,
            nextNode: fourth,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            controller: controller.controllers[3],
            currentNode: fourth,
          ),
        ],
      ),
    );
  }
}

class PinController
{
  final int pinSymbols;
  final List<TextEditingController> controllers;

  String get pin => controllers.map((e) => e.text).join();

  PinController(this.pinSymbols)
    : controllers = List.generate(pinSymbols, (index) => TextEditingController());

}
