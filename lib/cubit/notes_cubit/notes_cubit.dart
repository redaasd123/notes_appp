import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:note_apppp/cubit/notes_cubit/notes_state.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/widget/constance.dart';

class NotesCubit extends Cubit<NoteStates>{
  NotesCubit() : super(NoteInitial());
List<NoteModel>? notes;
  fetchAllNotes(){
      var noteBox = Hive.box<NoteModel>(kNotesBox);
         notes = noteBox.values.toList();
         emit(NoteSuccess());
    }
  }
