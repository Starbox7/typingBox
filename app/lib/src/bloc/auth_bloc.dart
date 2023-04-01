import 'dart:async';

import 'package:dio/dio.dart';

import '../data/repository/user.dart';

class AuthBloc {
  late bool _user;

  final StreamController _userSubject = StreamController.broadcast();

  bool get getUser => _user;
  Stream get user => _userSubject.stream;
  Future<Response?> signup(String id, String password) async {
    try {
      return await UserRepository.signup(id, password);
    } catch (err) {
      return null;
    }
  }
}
