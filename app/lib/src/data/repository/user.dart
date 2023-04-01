import 'package:dio/dio.dart';

class UserRepository {
  static String url = 'http://127.0.0.1:5001/users';

  static Future<Response?> signup(String id, String password) async {
    try {
      return await Dio().post('$url/signup', data: {
        'id': id,
        'password': password,
      });
    } catch (err) {
      print(err);
      return null;
    }
  }
}
