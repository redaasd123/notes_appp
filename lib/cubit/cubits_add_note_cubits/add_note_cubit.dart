import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/widget/constance.dart';

import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Color(0xff62DCF7);

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
  }
}
