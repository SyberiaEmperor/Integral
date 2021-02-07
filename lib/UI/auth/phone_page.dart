import 'package:flutter/material.dart';
import 'package:integral/UI/auth/pin_page.dart';
import 'package:integral/UI/auth/widgets/auth_title.dart';
import 'package:integral/UI/auth/widgets/phone_input_field.dart';

class PhonePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTitle(),
          PhoneInputField(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinPage(),
                  ));
            },
            child: Text('PIN'),
          ),
        ],
      ),
    );
  }
}
