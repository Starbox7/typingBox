import 'dart:async';
import 'package:app/src/bloc/auth/auth_bloc.dart';
import 'package:app/src/data/models/auth.dart';
import 'package:app/src/data/repository/auth_repository.dart';
import 'package:app/src/storage/storage.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class AuthViewModel {
  final AuthBloc _authBloc;
  final AuthRepository _authRepository;

  AuthViewModel({
    required AuthBloc authBloc,
    required AuthRepository authRepository,
  })  : _authBloc = authBloc,
        _authRepository = authRepository;

  Future<bool> auto() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      Response res = await _authRepository.auto(tokens);
      Auth newAuth = Auth.fromJson(res.data as Map<String, dynamic>);
      String accessToken = newAuth.accessToken;
      String refreshToken = newAuth.refreshToken;
      await setTokens(accessToken, refreshToken);
      _authBloc.add(AuthSignInEvent());
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signup(String id, String password) async {
    Map<String, String> auth = {'id': id, 'password': password};
    try {
      Response res = await _authRepository.signup(auth);
      if (201 != res.statusCode) {
        throw ViewModelError(message: 'AuthViewModel.signup()');
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signin(String id, String password) async {
    Map<String, String> auth = {'id': id, 'password': password};
    try {
      Response res = await _authRepository.signin(auth);
      Auth newAuth = Auth.fromJson(res.data as Map<String, dynamic>);
      String accessToken = newAuth.accessToken;
      String refreshToken = newAuth.refreshToken;
      await setTokens(accessToken, refreshToken);
      _authBloc.add(AuthSignInEvent());
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signout() async {
    try {
      await removeTokens();
      _authBloc.add(AuthSignOutEvent());
      return true;
    } catch (err) {
      return false;
    }
  }
}
