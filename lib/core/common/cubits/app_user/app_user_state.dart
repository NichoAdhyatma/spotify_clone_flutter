part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserGuest extends AppUserState {}

final class AppUserAuthenticated extends AppUserState {
  final UserEntity user;

  AppUserAuthenticated(this.user);
}
