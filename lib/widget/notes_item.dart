import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_cubit.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/screens/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  final NoteModel note;

  const NotesItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditNoteView(noteModel: note),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(20),
        height: 180,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    note.subTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(
                    note.date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              icon: Icon(Icons.delete_outline, size: 28, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
