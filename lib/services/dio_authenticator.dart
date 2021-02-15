import 'package:integral/entities/user.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/models/authentification.dart';
import 'package:integral/services/requests.dart';

class DioAuthenticator implements AuthentificationInterface {
  @override
  Future<User> logIn(AuthData data) {
    return Requests.logIn(data);
  }

  @override
  Future<void> sendPassword(String phoneNumber) {}

  @override
  Future<User> signIn(AuthData data) {
    return Requests.createUser(data);
  }
}
