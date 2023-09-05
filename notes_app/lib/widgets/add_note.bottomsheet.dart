
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          child: BlocConsumer<AddNoteCubit,AddNoteState>(
            listener: (context,state){
          if(state is AddNoteFailure){
          print('failed ${state.errMessage}');
          }
    else if(state is AddNoteSuccess){
      BlocProvider.of<NoteCubit>(context).fetchNote();
      Navigator.pop(context);
    }
            },
            builder:(context,state){
             return AbsorbPointer(
            
              absorbing: state is AddNoteLoading ? true : false,
               child: Padding(
                 padding:  EdgeInsets.only(left:5,
                 bottom: MediaQuery.of(context).viewInsets.bottom
                 ),
                 child: SingleChildScrollView(
                   child: const AddNoteForm()
                   ),
               ),
             );
            } 
          ),
        ),
    );
  }
}
