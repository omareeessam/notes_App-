
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../models/note_model.dart';

class CustomNoteItem extends StatelessWidget {
  CustomNoteItem({super.key,required this.note});
  
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
Navigator.push(context,MaterialPageRoute(builder: (context) => EditNoteView(note: note,),));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(10)),
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,
                  style: TextStyle(fontSize: 25, color: Colors.black)),
              subtitle: Text(note.subTitle,
                  style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(.5))),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchNote();
                  },
                  icon: Icon(
                    size:30,
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 80,
            ),
            Text(note.date,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(.5),
                ))
          ],
        ),
       
      ),
    );
  }
}