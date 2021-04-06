import 'package:integral/models/user_data_repository.dart';

import 'auth_data.dart';

class SharedPreferencessRepository extends UserDataRepository {
  @override
  Future<AuthData> getData() {
    print('Unimplemented!');
    return null;
  }

  @override
  Future<void> setData(AuthData data) {
    print('Unimplemented!');
    return null;
  }

  @override
  Future<void> deleteData() {
    print('Unimplemented!');
    return null;
  }
}
