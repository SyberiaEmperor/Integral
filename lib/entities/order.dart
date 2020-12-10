import 'dish.dart';

class Order {
  final Map<Dish, int> dishes;

  Order(this.dishes);

  double getPrice() {
    double price = 0.0;

    dishes.forEach((key, value) {
      price += key.price * dishes[key];
    });

    return price;
  }
}
