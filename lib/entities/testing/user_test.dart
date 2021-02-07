import 'package:integral/entities/cart.dart';
import 'package:integral/entities/testing/test_strings.dart';

import '../user.dart';

class TestUser implements User {
  final String id;
  final String phone;
  final String token;
  final Cart cart;

  TestUser()
      : id = TestAppStrings.USER_ID,
        phone = TestAppStrings.USER_PHONE,
        token = TestAppStrings.USER_TOKEN,
        cart = Cart();
}
