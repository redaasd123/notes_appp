import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/cubits_add_note_cubits/add_note_cubit.dart';
import '../cubit/cubits_add_note_cubits/add_note_state.dart';
import '../cubit/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';


class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>
          (builder: (context, state) {
          return AbsorbPointer(
            //AbsorbPointer عشان وهو بيحمل ميخليش لل user ا ي تحكم
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding:  EdgeInsets.only(left: 16,
              right: 16,
              bottom:MediaQuery.of(context).viewInsets.bottom),
              child : const SingleChildScrollView
                (child : const AddNoteForm()),
            ),
          );
            //integrate
            //rebuild ui

        },
            listener: (context, state) {
              if (state is AddNoteFailure) {
             print(state.message);
              }
              if (state is AddNoteSuccess) {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            }),

      ),
    );
  }
}






