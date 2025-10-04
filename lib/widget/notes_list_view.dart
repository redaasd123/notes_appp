import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_cubit.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_state.dart';
import 'package:note_apppp/models/note_models.dart';

import 'notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NoteStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>
          (context).notes!;
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 8.0),
              child: NotesItem(note:notes [index],),
            );
          },
        );
      },
    );
  }
}