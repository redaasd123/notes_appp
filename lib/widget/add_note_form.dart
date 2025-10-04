import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/widget/color_item.dart';

import '../cubit/cubits_add_note_cubits/add_note_cubit.dart';
import '../cubit/cubits_add_note_cubits/add_note_state.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "title",
          ),
          SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          SizedBox(height: 20,),
          ColorListView(),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return AddCustomButton(
                isLoading: state is AddNoteLoading? true : false ,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    String formattedDate =
                    DateFormat('EEEE dd MMMM yyyy – hh:mm a', 'ar')
                        .format(DateTime.now());

                   //trigger
                    NoteModel noteModel = NoteModel(title: title!,
                        subTitle: subTitle!
                        , date: formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);


                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {
                    });
                  }
                },
              );
            },
          ),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}




