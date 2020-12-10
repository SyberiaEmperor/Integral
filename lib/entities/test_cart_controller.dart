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
  Future<void> deleteFromCart(Dish dish) {
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
}