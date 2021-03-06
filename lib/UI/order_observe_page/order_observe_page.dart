import 'package:flutter/material.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/entities/api/order_from_api.dart';

class OrderObservePage extends StatelessWidget {
  final FullOrder order;

  const OrderObservePage({Key key, this.order}) : super(key: key);

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
              'ЗАКАЗ #${order.id}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Цена: ${order.total}р',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Дата: ${order.createdAt}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Статус: ${order.orderQueue}',
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
            child: Text('Отменить заказ'),
          ),
        ),
      ),
    );
  }
}
