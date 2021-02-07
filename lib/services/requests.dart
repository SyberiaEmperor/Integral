import 'package:dio/dio.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/entities/user.dart';
import 'package:integral/resources/app_strings.dart';

class Requests {
  static const IP = '178.154.255.209:3777';
  static const BASE_URI = 'http://$IP';

  static const _DISHES = "/dishes";
  static const _USER = "/user";
  static const _TOKEN = '/user_token';

  static const TIMEOUT = 5000;

  static Dio _baseDio;

  static void initReqs() {
    _baseDio = Dio();

    _baseDio.options.baseUrl = BASE_URI;
    _baseDio.options.connectTimeout = TIMEOUT;
    _baseDio.options.receiveTimeout = TIMEOUT;
    _baseDio.options.contentType = Headers.jsonContentType;
  }

//TODO: Wrap with try-catch DioErrors
  static Future<User> logIn(AuthData data) async {
    Response response =
        await _baseDio.post(_TOKEN, data: {'auth': data.toJson()});
    print(response.data);
  }

//TODO: Wrap with try-catch DioErrors
  static Future<User> createUser(AuthData data) async {
    Response response = await _baseDio.post(
      _USER,
      data: {
        'user': {
          AppAuthStrings.LOGIN: data.login,
          AppAuthStrings.PASSWORD: data.password,
        },
      },
    );
    print(response);
  }

//TODO: Wrap with try-catch DioErrors
  static Future<List<Dish>> getDishes() async {
    String path = buildPathForBaseUri([_DISHES]);

    Response response = await _baseDio.get(path);

    if (response.statusCode == 200) {
      List<Dish> dishes = [];
      List<dynamic> body = response.data;
      body.forEach((element) {
        dishes.add(Dish.fromData(element));
      });
      return dishes;
    }
    if (response.statusCode == 204) {
      return [];
    } else {
      throw RequestException("Ошибка при запросе");
    }
  }

  static String buildPathForBaseUri(List<String> args) => args.join();
  static String buildPathWithUri(String url, List<String> args) =>
      url + args.join();
}

class RequestException implements Exception {
  final String message;

  RequestException(this.message);
}
