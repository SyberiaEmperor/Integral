import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integral/UI/auth/phone_page.dart';
import 'package:integral/entities/testing/udr_test.dart';
import 'package:integral/services/dio_authenticator.dart';
import 'package:integral/services/requests.dart';
import 'package:integral/services/responsive_size.dart';
import 'package:integral/services/sp_data_rep.dart';

import 'blocs/auth_bloc/auth_bloc.dart';

// Requests.createUser(AuthData(login: '89999999999', password: '1234'));
void main() {
  runApp(MyApp());
  Requests.initReqs();
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
        Requests.initReqs();
        return BlocProvider(
          create: (context) => AuthBloc(
            SpDataRepository(),
            DioAuthenticator(),
          )..add(AuthFirstCheckEvent()),
          child: PhonePage(),
        );
      }),
    );
  }
}
