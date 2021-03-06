import 'package:flutter/material.dart';
import 'package:integral/UI/order_observe_page/order_observe_page.dart';
import 'package:integral/UI/widget/screen_with_updater.dart';
import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/entities/full_order_updater.dart';
import 'package:integral/services/requests.dart';

class OrderObserveRoute extends MaterialPageRoute {
  OrderObserveRoute(
    int orderId, {
    updatePeriod = const Duration(
      milliseconds: Requests.TIMEOUT,
    ),
  }) : super(
          builder: (context) => ScreenWithUpdater<FullOrder>(
            updatePeriod: updatePeriod,
            updater: FullOrderUpdater(orderId),
            bodyBuilder: (ctx, order) => OrderObservePage(
              order: order,
            ),
          ),
        );
}
