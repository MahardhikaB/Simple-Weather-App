import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/note_data.dart';
import 'package:weather_app/models/note.dart';
import 'package:weather_app/pages/editing_note.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  // Create New Note
  void createNewNote() {
    // Create new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    // Create new note
    Note newNote = Note(
      id: id,
      text: '',
    );
    // Edit note
    goToNotePage(newNote, true);
  
  }

  // Go to Note Editing Page
  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditingNotePage(
      note: note,
      isNewNote: false,
      ),
    ));
  }

  // Delete Note
  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          backgroundColor: Colors.grey[300],
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            ),
          ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 75),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getAllNotes().length,
                (index) => CupertinoListTile(
                  title: Text(value.getAllNotes()[index].text
                  )
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}