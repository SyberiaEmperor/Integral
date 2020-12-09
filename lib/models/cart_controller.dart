import 'package:integral/entities/dish.dart';

abstract class CartController {
  Future<void> addToCart(Dish dish);
  Future<void> removeFromCart(Dish dish);
  Future<void> deleteFromCart(Dish dish);

  int get totalCount;
}
