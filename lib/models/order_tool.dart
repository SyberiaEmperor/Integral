import 'package:integral/entities/dish.dart';

abstract class OrderTool {
  Future<bool> makeAnOrder(Map<Dish, int> dishes, double totalPrice);
}
