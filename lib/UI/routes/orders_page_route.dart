import 'package:flutter/material.dart';
import 'package:integral/UI/orders_page/orders_page.dart';
import 'package:integral/UI/widget/screen_with_updater.dart';
import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/entities/orders_page_updater.dart';
import 'package:integral/services/requests.dart';

class OrdersPageRoute extends MaterialPageRoute {
  OrdersPageRoute({
    updatePeriod = const Duration(
      milliseconds: Requests.TIMEOUT,
    ),
  }) : super(
          builder: (context) => ScreenWithUpdater<List<OrderFromApi>>(
            updatePeriod: updatePeriod,
            updater: OrdersPageUpdater(),
            bodyBuilder: (context, orders) => OrdersPage(microOrders: orders),
          ),
        );
}
