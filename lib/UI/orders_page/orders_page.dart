import 'package:flutter/material.dart';
import 'package:integral/UI/orders_page/widgets/order_tile.dart';
import 'package:integral/UI/widget/back_button.dart';
import 'package:integral/services/responsive_size.dart';

class OrdersPage extends StatelessWidget {
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
          children: [
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
            OrderTile(),
          ],
        ),
      ),
    ));
  }
}
