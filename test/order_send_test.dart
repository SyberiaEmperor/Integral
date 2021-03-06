import 'package:flutter_test/flutter_test.dart';
import 'package:integral/entities/api/order_to_api.dart';

void main() {
  test("testing JsonConverting", () {
    var order = OrderToApi(
      totalPrice: 12,
      items: [
        OrderItemToApi(dishId: '123', quantity: 1),
        OrderItemToApi(dishId: '111', quantity: 4),
      ],
    );
    print(order.toJson());
  });
}
