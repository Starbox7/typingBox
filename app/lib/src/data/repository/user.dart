import 'package:dio/dio.dart';

class UserRepository {
  static String url = 'http://127.0.0.1:5001/users';

  static Future<Response> signup(String id, String password) async {
    try {
      return await Dio().post('$url/signup', data: {
        'id': id,
        'password': password,
      });
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  static Future<Response> signin(String id, String password) async {
    try {
      return await Dio()
          .post('$url/signin', data: {'id': id, 'password': password});
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  static Future<Response> auto(Map<String, String> tokens) async {
    try {
      return await Dio(BaseOptions(headers: tokens)).get('$url/signin');
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
