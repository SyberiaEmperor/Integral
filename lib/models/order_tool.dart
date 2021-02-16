import 'package:integral/entities/dish.dart';

abstract class OrderTool {
  Future<void> makeAnOrder(Map<Dish, int> dishes, double totalPrice);
}
