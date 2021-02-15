import 'package:flutter_test/flutter_test.dart';
import 'package:integral/blocs/auth_bloc/auth_bloc.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/entities/testing/auth_test.dart';
import 'package:integral/entities/testing/udr_test.dart';
import 'package:integral/models/authentification.dart';
import 'package:integral/models/user_data_repository.dart';

void main() {
  test(
    'Initialization',
    () {
      UserDataRepository udr = UDRTest();
      Authenticator authService = TestAuth();
      AuthBloc authBloc = AuthBloc(udr, authService);
      expect(authBloc.state, isInstanceOf<AuthMainState>());
    },
  );
  test(
    'On event',
    () {
      UserDataRepository udr = UDRTest();
      Authenticator authService = TestAuth();
      AuthBloc authBloc = AuthBloc(udr, authService);
      authBloc.add(AuthLogInEvent(login: '', password: ''));
      authBloc.listen(
        (state) {
          expect(state, isInstanceOf<AuthInProgressState>());
        },
      );
    },
  );
  test(
    'Signing in',
    () {
      String login = 'login';
      String password = 'password';
      UserDataRepository udr = UDRTest();
      Authenticator authService = TestAuth();
      AuthBloc authBloc = AuthBloc(udr, authService);
      authBloc.listen((state) async {
        if (state is AuthLoggedInState) {
          AuthData data = await udr.getData();
          expect(data.login, login);
          expect(data.password, password);
        }
      });
      authBloc.add(AuthSignInEvent(login: login, password: password));
    },
  );
  test(
    'FirstCheck when udr has data',
    () {
      String login = 'login';
      String password = 'password';
      UserDataRepository udr = UDRTest();
      udr.setData(AuthData(login: login, password: password));
      Authenticator authService = TestAuth();
      AuthBloc authBloc = AuthBloc(udr, authService);
      authBloc.add(AuthFirstCheckEvent());
      var expectedState = authBloc.skip(1).last;
      expectedState.then(
        (state) => expect(state, isInstanceOf<AuthLoggedInState>()),
      );
    },
  );
}
