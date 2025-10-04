import 'package:flutter/material.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/widget/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: EditNoteViewBody(noteModel: noteModel),
    );
  }
}
