import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite/sqflite.dart';
import 'package:strawberrydaydreams/services/auth/auth_service.dart';
import 'package:strawberrydaydreams/services/auth/crud/notes_service.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({super.key});

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

//creating a new note

class _NewNoteViewState extends State<NewNoteView> {
  DataBaseNotes? _note;
  late final NoteService _noteService;
  //text field text syncing
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _noteService = NoteService();
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _textEditingControllerListener() async {
    final note = _note;
    if (note == null) {
      return;
    }
    final text = _textEditingController.text;
    await _noteService.updateNotes(
      note: note,
      text: text,
    );
  }

  void _setupTextEditingControllerListener() async {
    _textEditingController.removeListener(_textEditingControllerListener);
    _textEditingController.addListener(_textEditingControllerListener);
  }

  Future<DataBaseNotes> createNewNote() async {
    final existingNote = _note;
    if (existingNote != null) {
      return existingNote;
    }

    final currentUser = AuthService.firebase().currentUser!;
    final email = currentUser.email!;
    final owner = await _noteService.getUser(email: email);
    return await _noteService.createNote(owner: owner);
  }

  void _deleteNoteIfEmpty() {
    final note = _note;
    if (_textEditingController.text.isEmpty && note != null) {
      _noteService.deleteNote(id: note.id);
    }
  }

  void _saveNoteIfNotEmpty() async {
    final note = _note;
    final text = _textEditingController.text;
    if (note != null && text.isNotEmpty) {
      await _noteService.updateNotes(
        note: note,
        text: text,
      );
    }
  }

  @override
  void dispose() {
    _deleteNoteIfEmpty();
    _saveNoteIfNotEmpty();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: FutureBuilder(
        future: createNewNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _note = snapshot.data as DataBaseNotes;
              _setupTextEditingControllerListener();
              return TextField(
                controller: _textEditingController, //proxy to a text field in flutter
                //allowing user to make it multiline
                keyboardType: TextInputType.multiline,
                //expanding as u enter more lines
                maxLines: null,
                //placeholder text
                decoration: const InputDecoration(
                  hintText: 'enter your notes',
                ),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
