import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/entities/user.dart';
import 'package:integral/entities/user_repository.dart';
import 'package:integral/models/authentification.dart';
import 'package:integral/models/user_data_repository.dart';
import 'package:integral/utils/exceptions/auth_exceptions.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      UserDataRepository dataRepository, AuthentificationInterface authService)
      : _udr = dataRepository,
        _authService = authService,
        super(AuthMainState());

  final UserDataRepository _udr;
  final AuthentificationInterface _authService;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthInProgressState();
    if (event is AuthFirstCheckEvent) {
      AuthData data = await _udr.getData();
      if (data != null) {
        yield await auth(
          data,
        );
      }
    }
    if (event is AuthLogInEvent) {
      yield await auth(
        event.data,
      );
    }
    if (event is AuthSignInEvent) {
      yield await auth(
        event.data,
        signIn: true,
      );
    }
    if (event is AuthSendPasswordEvent) {
      _authService.sendPassword(event.phoneNumber);
    }
    yield AuthMainState();
  }

  Future<AuthState> auth(
    AuthData data, {
    bool signIn = false,
  }) async {
    try {
      var authMethod = signIn ? _authService.signIn : _authService.logIn;
      User user = await authMethod(data);
      UserRepository.setUser(user);
      _udr.setData(data);
      return AuthLoggedInState();
    } on AuthException catch (exception) {
      return AuthErrorState(exception.message);
    } on Exception {
      rethrow;
    }
  }
}
