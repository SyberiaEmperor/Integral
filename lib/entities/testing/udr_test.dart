import 'package:integral/entities/auth_data.dart';
import 'package:integral/models/user_data_repository.dart';

class UDRTest implements UserDataRepository {
  AuthData data;
  @override
  Future<AuthData> getData() async {
    print('Getting data');
    await Future.delayed(Duration(seconds: 1));
    assert(data != null);
    return data;
  }

  @override
  Future<void> setData(AuthData data) async {
    print('Setting data');
    await Future.delayed(Duration(seconds: 1));
    data = data;
  }
}
