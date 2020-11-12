import 'package:flutter/material.dart';
import 'package:integral/UI/main_page/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integral',
      theme: ThemeData(
          primaryColor: Color(0xffF5F7FA),
          backgroundColor: Color(0xffF5F7FA),
          accentColor: Color(0xffFA7022),
      home: MainPage(),
    );
  }
}
