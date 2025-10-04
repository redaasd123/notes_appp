import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_cubit.dart';

import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    //ikh هناانشات notes cubit جديدة عشان اعرضها
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomAppBar(
            title: 'Note',
            iconData: Icons.search,
          ),
        ),
        Expanded(
            child: NotesListView()
        ),
      ],
    );
  }
}
