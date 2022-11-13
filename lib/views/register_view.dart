import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/constants/routes.dart';
import 'package:strawberrydaydreams/views/util/show_err_dialog.dart';
import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      //Scaffold is the ownder of that white body below the blue bar.
      appBar: AppBar(
        title: const Text("Sign up"),
      ), //App Bar

      //to get this, select TextButtom then ctrl + ., select wrap with Center
      body: FutureBuilder(
        //we told futurebuilder to perform a future which is
        //firebase initialization.
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(hintText: "enter your email"),
                  ),
                  TextField(
                    controller: _password,
                    //these 3 are imp for password
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    //..................
                    decoration:
                        const InputDecoration(hintText: "enter your password"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                         await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        await user?.sendEmailVerification;
                        Navigator.of(context).pushNamed(verifyemailRoute);
                      } on FirebaseAuthException catch (e) {
                        await showErrDialog(context, e.toString());
                        if (e.code == 'email-already-in-use') {
                          await showErrDialog(context, "email already in use");
                        } //!!! add one for inavlid email too.
                      }
                    },
                    child: const Text('Register'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute, (route) => false);
                      },
                      child: const Text('already registered? login here <3')),
                ],
              );
            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }
}
