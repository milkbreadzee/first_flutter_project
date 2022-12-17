// This widget is the root
//typw stl to get the  auto complete
//loginview used to be homeview. created a new folder for it in views

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/constants/routes.dart';
import 'package:strawberrydaydreams/services/auth/auth_exceptions.dart';
import 'package:strawberrydaydreams/services/auth/auth_service.dart';
import 'package:strawberrydaydreams/views/util/show_err_dialog.dart';

import '../firebase_options.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  //late just means ill assign value later.
  //stateful has two functions -init and dispose
  //init is the one thats automatically called when your LoginView is created

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    //after you have created an init state for these two, you also need to dispose of it
    super.initState();
  }

  //disposing of the init functions
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(); //this is what changes the bg color. color: Colors.red, inside the ()
    return Scaffold(
      resizeToAvoidBottomInset : false,
      //backgroundColor: Colors.grey[300],
      //Scaffold is the ownder of that white body below the blue bar.

      //!---------------------!
      //app bar commented out

      /*appBar: AppBar(
        title: const Text("Login"),
      ), //App Bar */

      //!---------------------!

      //to get this, select TextButtom then ctrl + ., select wrap with Center
      body: FutureBuilder(
        //we told futurebuilder to perform a future which is
        //firebase initialization.
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          //fontFamily: ,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      //email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
                            controller: _email,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "enter your email",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15.0),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: TextField(
                            controller: _password,
                            //these 3 are imp for password
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            //..................
                            decoration: const InputDecoration(
                              hintText: "enter your password",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15.0),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 50)),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.white), //h =135
                            ),
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              try {
                                await AuthService.firebase().logIn(
                                  email: email,
                                  password: password,
                                );

                                final user = AuthService.firebase().currentUser;
                                if (user?.isEmailVerified ?? false) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    homeRoute,
                                    (route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    verifyemailRoute,
                                    (route) => false,
                                  );
                                }
                              } on UserNotFoundAuthException catch (e) {
                                await showErrDialog(
                                  context,
                                  'User not found',
                                );
                              } on WrongPasswordAuthException {
                                await showErrDialog(
                                  context,
                                  'Wrong Password',
                                );
                              } on InvalidEmailAuthException {
                                await showErrDialog(
                                  context,
                                  'Invalid Email',
                                );
                              } on GenericAuthException {
                                await showErrDialog(
                                  context,
                                  'Error',
                                );
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              registerRoute, (route) => false);
                        },
                        child: const Text(
                          "Dont have an account? Register here",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              );
            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }

  //throw UnimplementedError();
}
