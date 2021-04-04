import 'package:integral/entities/cart.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/cart_controller.dart';

class TestCartController implements CartController {
  final Cart _cart;

  TestCartController(this._cart);

  @override
  Future<void> addToCart(Dish dish) {
    _cart.add(dish);
    return Future(() {});
  }

  @override
  Future<void> decrementFromCart(Dish dish) {
    _cart.decrement(dish);
    return Future(() {});
  }

  @override
  Future<void> removeFromCart(Dish dish) {
    _cart.delete(dish);
    return Future(() {});
  }

  @override
  int get totalCount => _cart.totalCount;

  @override
  int countOf(Dish dish) {
    return _cart.dishes[dish] ?? 0;
  }

  @override
  Map<Dish, int> get dishes => _cart.dishes;

  @override
  double get getTotalPrice {
    var total = _cart.totalPrice.toDouble();
    return total;
  }

  @override
  void clear() {
    _cart.clear();
  }
}
