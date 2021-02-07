import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/auth/pin_page.dart';
import 'package:integral/UI/auth/widgets/auth_title.dart';
import 'package:integral/UI/auth/widgets/phone_input_field.dart';
import 'package:integral/UI/main_page/main_page.dart';
import 'package:integral/blocs/auth_bloc/auth_bloc.dart';
import 'package:integral/blocs/main_page/mainpage_bloc.dart';
import 'package:integral/entities/data_repository.dart';
import 'package:integral/entities/test_dish_controller.dart';

class PhonePage extends StatelessWidget {
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedInState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => MainPageBloc(
                            cartController: DataRepository.cartController,
                            dishController: TestDishController(),
                          )..add(Update()),
                          child: MainPage(),
                        )));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTitle(),
            PhoneInputField(
              controller: phone,
            ),
            FlatButton(
              onPressed: () {
                authBloc.add(AuthAskPasswordEvent(phone.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: authBloc,
                        child: PinPage(
                          phone: phone.text,
                        ),
                      ),
                    ));
              },
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
