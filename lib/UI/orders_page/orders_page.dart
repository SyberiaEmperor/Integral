import 'package:flutter/material.dart';
import 'package:integral/UI/orders_page/widgets/order_tile.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/services/injector.dart';

class OrdersPage extends StatelessWidget {
  final List<OrderFromApi> microOrders;
  final VoidCallback update;

  OrdersPage({Key key, @required this.microOrders, @required this.update})
      : super(key: key) {
    Singletone().update = update;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: BackButtonLeading(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List<Widget>.from(
            microOrders.map(
              (order) => OrderTile(microOrder: order),
            ),
          ),
        ),
      ),
    ));
  }
}
