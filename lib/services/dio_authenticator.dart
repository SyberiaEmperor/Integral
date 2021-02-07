import 'package:integral/entities/user.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/models/authentification.dart';

class DioAuthenticator implements AuthentificationInterface {
  @override
  Future<User> logIn(AuthData data) {}

  @override
  Future<void> sendPassword(String phoneNumber) {}

  @override
  Future<User> signIn(AuthData data) {}
}
