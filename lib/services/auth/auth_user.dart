import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';

//creating a class
@immutable //this class  and all its subclasses is final
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  //factory constructor
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
  //were taking a copy of the user from firebase, creating an object and 
  //passing it to our class AuthUser.
}

//basically we just abstracted the firebase user into an auth user