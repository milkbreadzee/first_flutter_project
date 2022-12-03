import 'package:strawberrydaydreams/services/auth/auth_provider.dart';
import 'package:strawberrydaydreams/services/auth/auth_user.dart';
import 'package:strawberrydaydreams/services/auth/firebase_authprovider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);
  //constructor for provider

  //factory construcctor
  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
      );
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailAuthProvider() => provider.sendEmailAuthProvider();

  @override
  Future<void> initialize() => provider.initialize();
}
