import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/cubits_add_note_cubits/add_note_cubit.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_cubit.dart';
import 'package:note_apppp/widget/add_note_bottom_sheet.dart';
import 'package:note_apppp/widget/custom_app_bar.dart';
import 'package:note_apppp/widget/notes_item.dart';
import 'package:note_apppp/widget/notes_view_body.dart';

import '../widget/notes_list_view.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  static String id = 'NotesViews';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                context: context, builder: (context) {
              return const AddNoteBottomSheet(
              );
            });
          },
            child: Icon(Icons.add),),
          body: NotesViewBody()

    );
  }

}

