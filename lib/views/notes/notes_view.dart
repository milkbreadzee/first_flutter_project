import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/constants/routes.dart';
import 'package:strawberrydaydreams/services/auth/auth_service.dart';

import '../../enums/menu_action.dart';
import '../../services/auth/crud/notes_service.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NoteService _noteService; //connecting the ui to the database logic
  String get userEmail => AuthService.firebase().currentUser!.email!; //????

  @override
  void initState() {
    _noteService = NoteService();
    //_noteService.open(); we created _ensureDbISOpen in noteservice to make sure that the db is open before any of the functions in it are called,
    //which means we dont need to manually call the open functin now and everything realted to the db can we abstracted away.
    super.initState(); //???
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('♡ Notes ♡'),
          //logout option in menu
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(newNoteRoute);
                },
                icon: const Icon(Icons.add)),
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    //devtools.log(shouldLogout.toString());
                    if (shouldLogout) {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute,
                          (_) => false); //why dont you need route here???
                    }
                    break;
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                      value: MenuAction.logout, child: Text('Logout')),
                ];
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: _noteService.createOrGetUser(email: userEmail),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return StreamBuilder(
                  stream: _noteService
                      .allNotes, //stream is listening to all notes so the snapshot we get is all notes
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                        if (snapshot.hasData) {
                          print("hello");
                          final allNotes = snapshot.data as List<DataBaseNotes>;
                          return ListView.builder(
                            itemCount: allNotes.length,
                            itemBuilder: (context, index) {
                              return const Text("item");
                            },
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      case ConnectionState.waiting:
                        return const Text("hihi");
                      default:
                        return const CircularProgressIndicator();
                    }
                  },
                );
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sign out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Log Me Out")),
        ],
      );
    },
  ).then((value) => value ?? false); // if the user doesnt touch the
  //logout button, then it doesnt return a value. in that case
  //we need to make sure it returns bool false
}
