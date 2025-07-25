import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = const Duration(seconds: 15)
        ..options.receiveTimeout = const Duration(seconds: 15);
      dio!.options.headers = {'Accept': 'application/json'};
    }
    return dio!;
  }

  static Future<void> setToken(String token) async {
    await _secureStorage.write(key: 'access_token', value: token);
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static Future<void> loadToken() async {
    final token = await _secureStorage.read(key: 'access_token');
    if (token != null) {
      dio?.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'access_token');
    dio?.options.headers.remove('Authorization');
  }
}
