import 'cart.dart';

class User {
  final String id;
  final String phone;

  Cart cart;

  User(this.id, this.phone) : cart = Cart();

  factory User.test() {
    return User("123", "123456789");
  }
}
