import 'package:integral/entities/api/order_to_api.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/models/order_tool.dart';
import 'package:integral/services/requests.dart';

class DioOrderTool implements OrderTool {
  @override
  Future<bool> makeAnOrder(Map<Dish, int> dishes, double totalPrice) async {
    var order = OrderToApi.fromCart(dishes, totalPrice);
    return Requests.createOrder(order);
  }
}
