import 'package:flutter/material.dart';
import 'package:integral/UI/auth/widgets/pin_input_field.dart';
import 'package:integral/UI/default_pages/loading_page.dart';
import 'package:integral/UI/default_pages/warning_snackbar.dart';
import 'package:integral/UI/main_page/main_page.dart';
import 'package:integral/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/blocs/main_page/mainpage_bloc.dart';
import 'package:integral/entities/data_repository.dart';
import 'package:integral/blocs/cart_counter_bloc/cart_counter_bloc.dart'
    as cartCounter;
import 'package:integral/entities/testing/test_dish_controller.dart';

class PinPage extends StatelessWidget {
  final PinController controller = PinController(4);
  final String phone;

  PinPage({Key key, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            bottomWarningBar(context, state.caption);
          }
          if (state is AuthLoggedInState) {
            Navigator.popUntil(context, (route) => false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) => cartCounter.CartCounterBloc()),
                  BlocProvider(
                    create: (context) => MainPageBloc(
                      cartController: DataRepository.cartController,
                      dishController: TestDishController(),
                    )..add(
                        Update(),
                      ),
                  ),
                ], child: MainPage()),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthMainState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pin4SymInputField(controller),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthSignInEvent(
                        login: phone, password: controller.pin));
                  },
                  child: Text('Подтвердить'),
                ),
              ],
            );
          }
          if (state is AuthInProgressState) {
            return LoadingPage(caption: 'Получение данных');
          }
          return Container();
        },
      ),
    );
  }
}
