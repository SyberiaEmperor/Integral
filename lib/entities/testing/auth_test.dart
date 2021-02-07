import 'package:integral/entities/user.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/models/authentification.dart';
import 'package:integral/utils/exceptions/auth_exceptions.dart';

class TestAuth implements AuthentificationInterface {
  @override
  Future<User> logIn(AuthData data) async {
    print('Loggin in');
    await Future.delayed(Duration(seconds: 1));
    return User.test();
  }

  @override
  Future<User> signIn(AuthData data) async {
    print('Signing in');
    await Future.delayed(Duration(seconds: 1));
    if (data.password == '1234')
      return User.test();
    else
      throw AuthException('Некорректные данные');
  }

  @override
  Future<void> sendPassword(String phoneNumber) async {
    print('Sending');
    await Future.delayed(Duration(seconds: 1));
  }
}
