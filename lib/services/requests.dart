import 'dart:io';

import 'package:dio/dio.dart';
import 'package:integral/entities/api/order_to_api.dart';
import 'package:integral/entities/auth_data.dart';
import 'package:integral/entities/dish.dart';
import 'package:integral/entities/user.dart';
import 'package:integral/resources/app_strings.dart';
import 'package:integral/utils/exceptions/auth_exceptions.dart';

class Requests {
  static const IP = '178.154.255.209:3777';
  static const BASE_URI = 'http://$IP';

  static const _DISHES = "/dishes";
  static const _USER = "/user";
  static const _TOKEN = '/user_token';
  static const _ORDERS = '/orders';

  static const TIMEOUT = 5000;

  static String _jwt;

  static Dio _baseDio;
  static Dio _jwtDio;

  static void initReqs() {
    _baseDio = Dio();

    _baseDio.options.baseUrl = BASE_URI;
    _baseDio.options.connectTimeout = TIMEOUT;
    _baseDio.options.receiveTimeout = TIMEOUT;
    _baseDio.options.contentType = Headers.jsonContentType;
  }

  static void initJwt() {
    _jwtDio = Dio(
      BaseOptions(
        baseUrl: BASE_URI,
        connectTimeout: TIMEOUT,
        receiveTimeout: TIMEOUT,
        contentType: Headers.jsonContentType,
        headers: {
          DioStrings.AUTH_HEADER: DioStrings.BEARER + _jwt,
        },
      ),
    );
  }

  static Future<User> logIn(AuthData data) async {
    try {
      Response response =
          await _baseDio.post(_TOKEN, data: {'auth': data.toJson()});
      print(response.data);
      if (response.statusCode == HttpStatus.created) {
        //TODO: Remove _jwt ?
        _jwt = response.data[AppUserStrings.TOKEN];
        initJwt();
        return User.fromJson(Map<String, String>.from(response.data));
      }
    } on DioError catch (error) {
      throw AuthException(error.message);
    }
  }

  static Future<User> createUser(AuthData data) async {
    try {
      Response response = await _baseDio.post(
        _USER,
        data: {
          'user': {
            AppAuthStrings.LOGIN: data.login,
            AppAuthStrings.PASSWORD: data.password,
          },
        },
      );
      if (response.statusCode == HttpStatus.created) {
        //TODO: Remove _jwt ?
        _jwt = response.data[AppUserStrings.TOKEN];
        initJwt();
        return User.fromJson(response.data);
      }
    } on DioError catch (error) {
      throw AuthException(error.message);
    }
  }

  static Future<bool> createOrder(OrderToApi order) async {
    Response response = await _jwtDio.post(_ORDERS, data: order.toJson());
    return response.statusCode == HttpStatus.ok;
  }

//TODO: Wrap with try-catch DioErrors
  static Future<List<Dish>> getDishes() async {
    String path = buildPathForBaseUri([_DISHES]);

    Response response = await _baseDio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      List<Dish> dishes = [];
      List<dynamic> body = response.data;
      body.forEach((element) {
        dishes.add(Dish.fromData(element));
      });
      return dishes;
    }
    if (response.statusCode == HttpStatus.noContent) {
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
