part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}

final class AuthSuccessState extends AuthState {
  final UserEntity user;

  AuthSuccessState({required this.user});
}


