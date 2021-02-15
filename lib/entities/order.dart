import 'package:integral/entities/order_dish.dart';

class Order {
  final List<OrderDish> dishes;

  Order(this.dishes);

  double getPrice() {
    double price = 0.0;

    dishes.forEach((value) {
      price += value.fullPrice;
    });

    return price;
  }
}
