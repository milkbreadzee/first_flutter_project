import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/constants/routes.dart';
import 'package:strawberrydaydreams/services/auth/auth_exceptions.dart';
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
      resizeToAvoidBottomInset : false,
      //Scaffold is the ownder of that white body below the blue bar.

      //!---------------!

      /*commenting out the app bar

      appBar: AppBar(
        title: const Text("Sign up"),
      ), //App Bar*/

      //!---------------!

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
              return SafeArea(
                  child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        //fontFamily: ,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

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
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              hintText: "enter your name",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15.0)),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

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
                              contentPadding: EdgeInsets.all(15.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 50)),
                            foregroundColor: MaterialStateProperty.all(Colors.white), //h =135 
                          ),
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
                            } on EmailAlreadyInUseAuthException {
                              await showErrDialog(
                                context,
                                'Email Already In Use',
                              );
                            } on WeakPasswordAuthException {
                              await showErrDialog(
                                context,
                                'Weak Password',
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
                          child: const Text('Register'),
                        ),
                      ),
                    ),


                    TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              loginRoute, (route) => false);
                        },
                        child: const Text('Have an account? Login')),

                    Column(children: <Widget>[
            
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 36,
                                
                              )),
                        ),

                        const Text("OR"),

                        Expanded(
                          child:  Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                              child:const  Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),

                      ]),
                    
                    ]),

                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 50)),
                            foregroundColor: MaterialStateProperty.all(Colors.white), //h =135 
                          ),
                          onPressed: () {
                            
                          },
                           child: const Text('Signup As Service Provider'),
                          /*
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
                            } on EmailAlreadyInUseAuthException {
                              await showErrDialog(
                                context,
                                'Email Already In Use',
                              );
                            } on WeakPasswordAuthException {
                              await showErrDialog(
                                context,
                                'Weak Password',
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
                          },*/
                         
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }
}
