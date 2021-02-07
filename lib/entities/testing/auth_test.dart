import 'package:integral/entities/user.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/models/authentification.dart';

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
    return User.test();
  }
}
