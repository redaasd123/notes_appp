import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/notes_cubit/notes_cubit.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/widget/color_item.dart';
import 'package:note_apppp/widget/constance.dart';
import 'package:note_apppp/widget/custom_app_bar.dart';
import 'package:note_apppp/widget/custom_text_field.dart';

import '../cubit/cubits_add_note_cubits/add_note_cubit.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;


  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  late TextEditingController titleController;
  late TextEditingController contentController;
   String? title,content;


   @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.noteModel.title);
    contentController = TextEditingController(text: widget.noteModel.subTitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:  Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
              widget.noteModel.subTitle = content??widget.noteModel.subTitle;
              widget.noteModel.title = title??widget.noteModel.title;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            iconData: Icons.check,
          ),
          SizedBox(height: 50,),

          CustomTextField(
            controller: titleController,
              onChanged: (value){
                title = value;
              },),
          SizedBox(height: 20,),
          CustomTextField(
            controller: contentController,
            onChanged: (value){
              content = value;
            },
           // hint: widget.noteModel.subTitle,
          maxLines: 5,),
          SizedBox(height: 20,),
          EditNoteColorList(noteModel:widget.noteModel,)
        ],
      ),
    );
  }
}

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList>
{
late int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = kColor.indexOf(Color(widget.noteModel.color));//  defult
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          itemCount: kColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: (){
                    currentIndex = index;
                    widget.noteModel.color = kColor[index].value;
                    setState(() {
                    });
                },
                child: ColorItem(
                  color: kColor[index],
                  isActive: currentIndex == index,
                ),
              ),
            );

          }),

    );
  }
}
