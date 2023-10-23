import 'package:flutter/material.dart';
import 'package:weather_app/models/note.dart';

class NoteData extends ChangeNotifier {
  // List Notes
  List<Note> allNotes = [
    Note(
      id: 0, 
      text: 'First note'
    ),
  ];

  // get Notes
  List<Note> getAllNotes(){
    return allNotes;
  }

  // add Note
  void addNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // update Note
  void updateNoteById(int id, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  // delete Note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}