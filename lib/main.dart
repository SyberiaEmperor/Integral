import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/main_page/main_page.dart';
import 'package:integral/entities/cart.dart';
import 'package:integral/entities/data_repository.dart';
import 'package:integral/entities/test_cart_controller.dart';
import 'package:integral/entities/test_dish_controller.dart';
import 'package:integral/entities/user.dart';
import 'package:integral/services/responsive_size.dart';

import 'blocs/main_page/mainpage_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ResponsiveSize.init(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width);
        return Theme(
          isMaterialAppTheme: true,
          data: ThemeData(
            primaryColor: Color(0xffF5F7FA),
            backgroundColor: Color(0xffFFFFFF),
            accentColor: Color(0xffFA7022),
            cursorColor: Color(0xff435D6B),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: ResponsiveSize.height(35.0),
              ),
            ),
            primaryTextTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: ResponsiveSize.height(18.0),
              ),
            ),
            accentTextTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: ResponsiveSize.height(13.0),
                color: Color(0xff667C8A),
              ),
              bodyText2: TextStyle(
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: ResponsiveSize.height(13.0),
                color: Colors.black,
              ),
              button: TextStyle(
                  fontSize: ResponsiveSize.height(14), color: Colors.white),
              subtitle1: TextStyle(
                  fontSize: ResponsiveSize.height(14), color: Colors.white),
            ),
          ),
          child: child,
        );
      },
      title: 'Integral',
      theme: ThemeData(),
      home: Builder(builder: (context) {
        //TODO:Временно для тестов
        DataRepository.init(user: User.test());
        //TODO:

        return BlocProvider(
          create: (context) => MainPageBloc(
            cartController: DataRepository.cartController,
            dishController: TestDishController(),
          ),
          child: MainPage(),
        );
      }),
    );
  }
}
