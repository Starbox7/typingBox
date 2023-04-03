import 'dart:async';

import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

import '../data/repository/user.dart';

class AuthBloc {
  bool _user = false;

  final StreamController _userController = StreamController.broadcast();

  bool get user => _user;
  Stream get userStream => _userController.stream;

  void init() => _userController.sink.add(_user);

  Future<Response?> signup(String id, String password) async {
    try {
      return await UserRepository.signup(id, password);
    } catch (err) {
      return null;
    }
  }

  Future<void> signin(String id, String password) async {
    try {
      Response res = await UserRepository.signin(id, password);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _user = true;
      _userController.sink.add(_user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }

  Future<void> signout() async {
    try {
      await removeTokens();
      _user = false;
      _userController.sink.add(_user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }

  Future<void> auto() async {
    try {
      // gettoken
      Map<String, String> tokens = await getTokens();
      print(tokens);
      // res = repository auto
      Response res = await UserRepository.auto(tokens);
      // set token
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _user = true;
      _userController.sink.add(_user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }
}
