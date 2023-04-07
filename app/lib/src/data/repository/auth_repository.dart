import 'package:dio/dio.dart';
import 'package:app/src/constants/constants.dart';

class AuthRepository {
  Future<Response> signup(Map<String, String> auth) async {
    try {
      return await Dio().post('$authUrl/signup', data: auth);
    } catch (err) {
      print(err);
      throw Exception('DIO ERROR');
    }
  }

  Future<Response> signin(Map<String, String> auth) async {
    try {
      return await Dio().post('$authUrl/signin', data: auth);
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  Future<Response> auto(Map<String, String> tokens) async {
    try {
      return await Dio(BaseOptions(headers: tokens)).get('$authUrl/signin');
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
