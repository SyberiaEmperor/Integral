import 'package:flutter/material.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/services/responsive_size.dart';

class OrderObservePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: BackButtonLeading()),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ЗАКАЗ #11111111",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Цена 1500р",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Дата 21.01.2020",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Статус НЕИЗВЕСТНО",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text("Отменить заказ"),
          ),
        ),
      ),
    );
  }
}
