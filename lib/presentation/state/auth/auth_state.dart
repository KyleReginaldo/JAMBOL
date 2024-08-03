part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Registered extends AuthState {}

final class Registering extends AuthState {}

final class AuthError extends AuthState {}

final class LoggedIn extends AuthState {}

final class LoggingIn extends AuthState {}
