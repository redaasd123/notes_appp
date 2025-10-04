import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:note_apppp/models/note_models.dart';
import 'package:note_apppp/screens/notes_views.dart';
import 'package:note_apppp/widget/constance.dart';
import 'package:note_apppp/widget/simble_bloc_observe.dart';

import 'cubit/cubits_add_note_cubits/add_note_cubit.dart';
import 'cubit/notes_cubit/notes_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  // تهيئة التاريخ باللغة العربية
  await initializeDateFormatting('ar', '');

  runApp(NoteApp()); // تشغيل التطبيق
}


class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins'
        ),
        home: NotesViews(),

      ),
    );
  }
}



