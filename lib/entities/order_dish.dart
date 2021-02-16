import 'package:flutter/foundation.dart';
import 'package:integral/resources/app_strings.dart';

import 'dish.dart';

class OrderDish {
  final Dish dish;
  int quantity;
  int get fullPrice => dish.price * quantity;

  void increment() {
    ++quantity;
  }

  OrderDish({@required this.dish, @required this.quantity});

  factory OrderDish.fromJson(Map<String, dynamic> data) {
    int quantity = data[ApiStrings.ORDER_QUEUE];
    Dish dish = data[ApiStrings.DISH];
    return OrderDish(dish: dish, quantity: quantity);
  }
}
