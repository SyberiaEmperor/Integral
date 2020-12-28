import 'package:flutter/material.dart';
import 'package:integral/services/responsive_size.dart';

class AuthTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: ResponsiveSize.height(30),
          backgroundColor: Theme.of(context).canvasColor,
          backgroundImage: AssetImage('assets/integral.jpg'),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(ResponsiveSize.height(20)),
          child: Text(
            'Введите номер телефона:',
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
