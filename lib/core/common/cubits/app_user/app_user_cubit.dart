import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/common/entities/user_entitiy.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final FirebaseAuth _firebaseAuth;

  AppUserCubit({
    required FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        super(AppUserGuest());

  void isUserAuth() {
    _firebaseAuth.authStateChanges().listen(
      (user) {
        if (user == null) {
          emit(AppUserGuest());
        } else {
          emit(
            AppUserAuthenticated(
              UserEntity(
                id: user.uid,
                email: user.email,
                name: user.displayName,
              ),
            ),
          );
        }
      },
    );
  }

  void updateUser(UserEntity? user) {
    if (user == null) {
      emit(AppUserGuest());
    } else {
      emit(AppUserAuthenticated(user));
    }
  }
}
