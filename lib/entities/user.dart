import 'package:flutter/foundation.dart';
import 'package:integral/entities/testing/user_test.dart';
import 'package:integral/resources/app_strings.dart';

import 'cart.dart';

class User {
  final String id;
  final String phone;
  final String token;
  final Cart cart;

  User({@required this.id, @required this.phone, @required this.token})
      : cart = Cart();

  ///Creates a user with constant fields
  factory User.test() {
    return TestUser();
  }

  factory User.fromJson(Map<String, String> data) {
    String id = data[AppUserStrings.ID];
    String phone = data[AppUserStrings.PHONE];
    String token = data[AppUserStrings.TOKEN];
    return User(id: id, phone: phone, token: token);
  }
}
