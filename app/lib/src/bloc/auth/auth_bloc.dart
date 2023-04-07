import 'package:app/src/models/auth_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthModel> {
  AuthBloc() : super(AuthModel(auth: false)) {
    on<AuthSignInEvent>((AuthSignInEvent event, Emitter<AuthModel> emit) =>
        emit(AuthModel(auth: true)));
    on<AuthSignOutEvent>((AuthSignOutEvent event, Emitter<AuthModel> emit) =>
        emit(AuthModel(auth: false)));
  }
}
