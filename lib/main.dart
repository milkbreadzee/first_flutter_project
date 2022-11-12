//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/views/home_view.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:strawberrydaydreams/views/login_view.dart';
import 'package:strawberrydaydreams/views/register_view.dart';
import 'package:strawberrydaydreams/views/verifyemail_view.dart';
//import 'firebase_options.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); //!!!read documentation about this
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
         
        primarySwatch: Colors.pink,
      ),
      home: const LoginView(),
    ),
  );
}





