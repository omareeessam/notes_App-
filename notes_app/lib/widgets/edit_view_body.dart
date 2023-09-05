import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit.dart';
import 'package:notes_app/widgets/custom_app_Bar.dart';
import 'package:notes_app/widgets/custom_text.filed.dart';

import '../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Flexible(
              child: CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).fetchNote();
              Navigator.pop(context);
            },
            text: 'Edit Note',
            icon: Icons.check,
          )),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hintText: 'title',
            maxLines: 1,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hintText: 'hintText',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
