import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_buttom.dart';
import 'custom_text.filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'title',
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'content',
            maxLines: 6,
            onSaved: (Value) {
              subTitle = Value;
            },
          ),
          SizedBox(
            height: 40,
          ),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading ? true:false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                 var currentDate = DateTime.now();
                 var formatedCurrentData =DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedCurrentData,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
