import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_redirect_state.dart';

class SplashRedirectCubit extends Cubit<SplashRedirectState> {
  SplashRedirectCubit() : super(SplashRedirectInitial());

  void redirect() {
    Future.delayed(const Duration(seconds: 2), () {
      emit(SplashRedirectToGetStarted());
    });
  }
}
