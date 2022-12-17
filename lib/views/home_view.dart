import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/views/home/home.dart';
import 'package:strawberrydaydreams/views/login_view.dart';
import 'package:strawberrydaydreams/views/verifyemail_view.dart';

import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        //we told futurebuilder to perform a future which is
        //firebase initialization.
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const Home();
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
      ),
    );
  }
}
