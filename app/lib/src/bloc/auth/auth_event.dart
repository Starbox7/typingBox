part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthSignInEvent extends AuthEvent{}

class AuthSignOutEvent extends AuthEvent{}