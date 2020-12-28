import 'package:flutter/material.dart';
import 'package:integral/UI/auth/widgets/letter_node.dart';

class PinInputField extends StatelessWidget {
  FocusNode first = FocusNode();
  FocusNode second = FocusNode();
  FocusNode third = FocusNode();
  FocusNode fourth = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LetterNode(
            currentNode: first,
            nextNode: second,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            currentNode: second,
            nextNode: third,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            currentNode: third,
            nextNode: fourth,
          ),
          SizedBox(
            width: 50,
          ),
          LetterNode(
            currentNode: fourth,
          ),
        ],
      ),
    );
  }
}
