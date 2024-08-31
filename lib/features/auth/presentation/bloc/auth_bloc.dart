import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/features/auth/domain/entities/user.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthLoadingState());
    });

    on<AuthSignUpEvent>(_onAuthSignUpEvent);
    on<AuthSignInEvent>(_onAuthSignInEvent);
  }

  void _onAuthSignUpEvent(
      AuthSignUpEvent event, Emitter<AuthState> emit) async {
    final result = await _signUpUseCase(
      SignUpParams(
        email: event.email,
        name: event.name,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(
        AuthErrorState(message: failure.message),
      ),
      (user) => emit(
        AuthSuccessState(user: user),
      ),
    );
  }

  FutureOr<void> _onAuthSignInEvent(
      AuthSignInEvent event, Emitter<AuthState> emit) async {
    final result = await _signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(
        AuthErrorState(message: failure.message),
      ),
      (user) => emit(
        AuthSuccessState(user: user),
      ),
    );
  }
}
