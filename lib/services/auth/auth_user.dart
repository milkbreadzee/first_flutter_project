import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';

//creating a class
@immutable //this class  and all its subclasses is final
class AuthUser {
  final String? email; //making the string optionable
  final bool isEmailVerified;
  const AuthUser({
    required this.email,
    required this.isEmailVerified,
  });

  //factory constructor
  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
      );
  //were taking a copy of the user from firebase, creating an object and
  //passing it to our class AuthUser.
}

//basically we just abstracted the firebase user into an auth user
