import 'package:flutter/foundation.dart';
import 'package:integral/entities/testing/test_cart_controller.dart';
import 'package:integral/entities/user.dart';
import 'package:integral/models/cart_controller.dart';

class DataRepository {
  static User _user;
  static CartController _cartController;

  static User get user => _user;
  static CartController get cartController => _cartController;

  static void init({@required User user}) {
    assert(_user == null && user != null);
    assert(_cartController == null);

    _user = user;
    _cartController = TestCartController(user.cart);
  }
}
