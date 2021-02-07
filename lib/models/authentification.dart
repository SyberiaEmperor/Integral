import 'package:integral/entities/auth_data.dart';
import 'package:integral/entities/user.dart';

abstract class AuthentificationInterface {
  Future<User> logIn(AuthData data);
  Future<User> signIn(AuthData data);
}
