import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../../constant.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
List<NoteModel>? notes;
  fetchNote()async{
  
  var notesBox = Hive.box<NoteModel>(kNotesBox);
notes=  notesBox.values.toList()  ;
emit(NoteSuccess());
}
  }
