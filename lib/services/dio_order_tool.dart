import 'package:integral/entities/dish.dart';
import 'package:integral/models/order_tool.dart';

class DioOrderTool implements OrderTool {
  @override
  Future<void> makeAnOrder(Map<Dish, int> dishes, double totalPrice) {}
}
