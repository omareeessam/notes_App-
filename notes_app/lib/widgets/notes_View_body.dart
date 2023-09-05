import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit.dart';

import 'custom_app_Bar.dart';
import 'custom_note_item.dart';
import 'custom_notes_listview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchNote();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(text: 'Notes',icon: Icons.search,),
            SizedBox(
              height: 13,
            ),
            Expanded(child: NotesListView()),
          
          ],
        ),
    );
  }
}
