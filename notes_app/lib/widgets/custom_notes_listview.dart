import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
         List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes!;
         return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount:notes.length ,
            itemBuilder: (context, int) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomNoteItem(note: notes[int],),
              );
            },
          ),
        );
      },
    );
  }
}
//CustomNoteItem
