import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/auth/pin_page.dart';
import 'package:integral/UI/auth/widgets/auth_title.dart';
import 'package:integral/UI/auth/widgets/phone_input_field.dart';
import 'package:integral/blocs/auth_bloc/auth_bloc.dart';

class PhonePage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTitle(),
          PhoneInputField(
            controller: controller,
          ),
          FlatButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add();
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
