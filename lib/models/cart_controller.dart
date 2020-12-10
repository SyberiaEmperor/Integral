import 'package:integral/entities/dish.dart';

abstract class CartController {
  Future<void> addToCart(Dish dish);
  Future<void> removeFromCart(Dish dish);
  Future<void> decrementFromCart(Dish dish);
  int countOf(Dish dish);

  int get totalCount;
}
