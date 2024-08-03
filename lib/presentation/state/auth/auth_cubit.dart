// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jumbled/data/usecase/login.dart';
import 'package:jumbled/data/usecase/register.dart';
import 'package:jumbled/dto/create_user_dto.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._register,
    this._login,
  ) : super(AuthInitial());

  final Register _register;
  final Login _login;
  void reset() {
    emit(AuthInitial());
  }

  void register({required CreateUserDto createUserDto}) async {
    emit(Registering());
    final user = await _register(createUserDto: createUserDto);
    if (user != null) {
      emit(Registered());
    } else {
      emit(AuthError());
    }
  }

  void login({required String email, required String password}) async {
    emit(LoggingIn());
    final user = await _login(email: email, password: password);
    if (user != null) {
      emit(LoggedIn());
    } else {
      emit(AuthError());
    }
  }
}
