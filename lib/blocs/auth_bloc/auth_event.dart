part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final AuthData data;

  AuthLogInEvent({@required String login, @required String password})
      : data = AuthData(login: login, password: password);
}

class AuthSignInEvent extends AuthEvent {
  final AuthData data;

  AuthSignInEvent({@required String login, @required String password})
      : data = AuthData(login: login, password: password);
}

class AuthFirstCheckEvent extends AuthEvent {}

class AuthSendPasswordEvent extends AuthEvent {
  final String phoneNumber;

  AuthSendPasswordEvent(this.phoneNumber);
}
