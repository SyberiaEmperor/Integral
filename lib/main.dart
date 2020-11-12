import 'package:flutter/material.dart';
import 'package:integral/UI/dish_screen/dish_screen.dart';
import 'package:integral/UI/main_page/main_page.dart';
import 'package:integral/models/dish.dart';
import 'package:integral/services/responsive_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integral',
      home: Builder(builder: (context) {
        ResponsiveSize.init(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width);
        return Theme(
            data: ThemeData(
              primaryColor: Color(0xffF5F7FA),
              backgroundColor: Color(0xffFFFFFF),
              accentColor: Color(0xffFA7022),
              cursorColor: Color(0xff435D6B),
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
              ),
            ),
            child: MainPage());
      }),
    );
  }
}
