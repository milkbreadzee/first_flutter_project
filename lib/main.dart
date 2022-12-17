//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/constants/routes.dart';
import 'package:strawberrydaydreams/services/auth/auth_service.dart';
import 'package:strawberrydaydreams/views/home/home.dart';
//import 'package:strawberrydaydreams/views/home_view.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:strawberrydaydreams/views/login_view.dart';

import 'package:strawberrydaydreams/views/register_view.dart';
import 'package:strawberrydaydreams/views/verifyemail_view.dart';
import  'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //!!!read documentation about this
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        homeRoute:(context) =>  Home(),
        verifyemailRoute: (context) => const VerifyEmailView(),
        
      },
    ),
  );
}

//home page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //we told futurebuilder to perform a future which is
      //firebase initialization.
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return  Home();
              } else {
                return const Center(child: VerifyEmailView());
              }
            } else {
              return const LoginView();
            }

          //final user = FirebaseAuth.instance.currentUser;
          //if (user?.emailVerified ?? false) {
          //print('You are verified user');
          //} else {

          //!!!after verifying email, users need to be promted to log in again or firebase
          //wont recongnise that the user is email verified.!!!

          //return const VerifyEmailView();

          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const VerifyEmailView()));

          //this return was a bad idea bc flutter returns a erroe here bc youre returning a fucntion within scaffole???? check flutter git for more info later
          //navigator used to push a screen in front of
          //}
          // return const Text("Done.");

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
