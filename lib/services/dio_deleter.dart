import 'package:integral/models/order_deleter.dart';
import 'package:integral/services/requests.dart';

class DioDeleter implements OrderDeleter {
  final int orderId;

  DioDeleter(this.orderId);
  @override
  Future<void> deleteOrder() async {
    await Requests.deleteOrder(orderId);
  }
}
