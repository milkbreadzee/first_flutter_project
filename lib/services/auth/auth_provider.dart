//interface for all the servicer providers this application can
//work with in one interface.

//this file needs to be able to create an instance of AuthProvider to use
//that user data

import 'package:strawberrydaydreams/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser; //this interface needs to be able to get a user
  //data no matter what service they use to log in /sign up with
  //and also be able to log them in
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailAuthProvider();
}
