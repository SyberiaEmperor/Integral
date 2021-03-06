import 'dish.dart';

class Cart {
  Map<Dish, int> _dishes;
  Map<Dish, int> get dishes => Map<Dish, int>.from(_dishes);

  Cart() : _dishes = {};

  factory Cart.test() {
    Cart cart = Cart();
    cart.add(Dish.testDish());
    cart.add(Dish.testDish());
    cart.add(Dish.testDish2());
    cart.add(Dish.testDish2());
    cart.add(Dish.testDish3());
    cart.add(Dish.testDish3());
    cart.add(Dish.testDish3());
    return cart;
  }

  void add(Dish dish) {
    if (_dishes.containsKey(dish)) {
      ++_dishes[dish];
      return;
    }
    _dishes[dish] = 1;
  }

  void decrement(Dish dish) {
    if (_dishes.containsKey(dish)) {
      --_dishes[dish];
      if (_dishes[dish] == 0) {
        delete(dish);
      }
    }
  }

  void delete(Dish dish) {
    _dishes.remove(dish);
  }

  int get totalCount {
    return _dishes.length;
    /*int result = 0;
    for (int count in _dishes.values) {
      result += count;
    }
    return result;*/
  }

  int get totalPrice {
    int price = 0;
    _dishes.forEach((dish, count) {
      price += dish.price * count;
    });
    return price;
  }

  void clear() {
    _dishes.clear();
  }
}
