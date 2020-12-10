import 'dish.dart';

class Order {
  final Map<Dish, int> dishes;

  Order(this.dishes);

  double getPrice() {
    double price = 0.0;

    for (var dish in dishes.keys) {
      price += dish.price * dishes[dish];
    }

    return price;
  }
}
