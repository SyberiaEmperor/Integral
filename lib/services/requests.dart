import 'dart:io';

import 'package:dio/dio.dart';
import 'package:integral/entities/api/order_from_api.dart';
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

  static Dio _baseDio;
  static Dio _jwtDio;

  static void initReqs() {
    _baseDio = Dio();

    _baseDio.options.baseUrl = BASE_URI;
    _baseDio.options.connectTimeout = TIMEOUT;
    _baseDio.options.receiveTimeout = TIMEOUT;
    _baseDio.options.contentType = Headers.jsonContentType;
  }

  static void initJwt(String jwt) {
    _jwtDio = Dio(
      BaseOptions(
        baseUrl: BASE_URI,
        connectTimeout: TIMEOUT,
        receiveTimeout: TIMEOUT,
        contentType: Headers.jsonContentType,
        headers: {
          DioStrings.AUTH_HEADER: DioStrings.BEARER + jwt,
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
        var jwt = response.data[AppUserStrings.TOKEN];
        initJwt(jwt);
        return _getUser();
      }
    } on DioError catch (error) {
      throw AuthException(error.message);
    }
  }

  static Future<User> _getUser() async {
    Response response = await _jwtDio.get(_USER);
    return User.fromJson(Map<String, dynamic>.from(response.data));
  }

  static Future<User> createUser(AuthData data) async {
    try {
      await _baseDio.post(
        _USER,
        data: {
          'user': {
            AppAuthStrings.LOGIN: data.login,
            AppAuthStrings.PASSWORD: data.password,
          },
        },
      );
      return logIn(data);
    } on DioError catch (error) {
      throw AuthException(error.message);
    }
  }

  static Future<bool> createOrder(OrderToApi order) async {
    Response response = await _jwtDio.post(_ORDERS, data: order.toJson());
    return response.statusCode == HttpStatus.ok;
  }

  static Future<List<OrderFromApi>> getAllOrders() async {
    Response response = await _jwtDio.get(_ORDERS);
    if (response.statusCode == HttpStatus.ok) {
      List<OrderFromApi> orders = (response.data as List<dynamic>)
          .map((data) => OrderFromApi.fromJson(data))
          .toList();
      print(orders);
      return orders;
    }
    throw RequestException("Ошибка во время получения заказов");
  }

  static Future<FullOrder> getOrderById(int id) async {
    String path = buildPathForBaseUri([_ORDERS, "/", id.toString()]);

    print(path);
    Response response = await _jwtDio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> body = response.data;
      print(body);
      return FullOrder.fromJson(body);
    } else {
      throw RequestException("Такого заказа не существует");
    }
  }

//TODO: Wrap with try-catch DioErrors
  static Future<List<Dish>> getDishes() async {
    String path = buildPathForBaseUri([_DISHES]);

    Response response = await _jwtDio.get(path);

    if (response.statusCode == HttpStatus.ok) {
      List<Dish> dishes = [];
      List<dynamic> body = response.data;
      body.forEach(
        (element) {
          dishes.add(Dish.fromData(element));
        },
      );
      return dishes;
    }
    if (response.statusCode == HttpStatus.noContent) {
      return [];
    } else {
      throw RequestException("Ошибка при запросе");
    }
  }

  static Future<bool> deleteOrder(int orderId) async {
    try {
      String path = buildPathForBaseUri([
        _ORDERS,
        '/',
        orderId.toString(),
      ]);

      Response response = await _jwtDio.delete(path);

      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        throw RequestException('Ошибка во время выполнения запроса');
      }
    } on DioError catch (e) {
      if (e.response.statusCode == HttpStatus.forbidden)
        throw RequestException("Вы не можете удалить подтверждённый заказ");
      throw RequestException(e.message);
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
