part of 'splash_redirect_cubit.dart';

@immutable
sealed class SplashRedirectState {}

final class SplashRedirectInitial extends SplashRedirectState {
}

final class SplashRedirectToGetStarted extends SplashRedirectState {}
