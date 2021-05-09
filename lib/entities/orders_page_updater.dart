import 'package:integral/entities/api/order_from_api.dart';
import 'package:integral/models/updater.dart';
import 'package:integral/services/requests.dart';

class OrdersPageUpdater implements Updater<List<OrderFromApi>> {
  @override
  Future<List<OrderFromApi>> update() async {
    return Requests.getAllOrders();
  }
}
