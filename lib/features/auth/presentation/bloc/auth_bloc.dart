import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required SignInUseCase signInUseCase,
    required AppUserCubit appUserCubit,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthLoadingState());
    });

    on<AuthSignUpEvent>(_onAuthSignUpEvent);
    on<AuthSignInEvent>(_onAuthSignInEvent);
  }

  void _emitAuthSuccess(
    UserEntity user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccessState(user: user));
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
      (user) => _emitAuthSuccess(user, emit),
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
      (user) => _emitAuthSuccess(user, emit),
    );
  }

}
