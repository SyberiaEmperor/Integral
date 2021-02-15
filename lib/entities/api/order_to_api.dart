import 'package:flutter/foundation.dart';
import 'package:integral/resources/app_strings.dart';

class OrderToApi {
  final double totalPrice;
  final List<OrderItemToApi> items;

  OrderToApi({@required this.totalPrice, @required this.items});

  Map<String, dynamic> toJson() {
    return {
      ApiStrings.TOTAL_PRICE: totalPrice,
      ApiStrings.ORDER_DISHES: List.from(items.map((item) => item.toJson())),
    };
  }
}

class OrderItemToApi {
  final int quantity;
  final String dishId;

  OrderItemToApi({@required this.quantity, @required this.dishId});

  Map<String, int> toJson() {
    return {
      ApiStrings.QUANTITY: quantity,
      ApiStrings.DISH_ID: int.parse(dishId),
    };
  }
}
