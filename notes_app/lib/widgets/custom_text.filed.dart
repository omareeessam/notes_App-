import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 const CustomTextField({super.key,required this.hintText, this.maxLines = 1, this.onSaved, this.onChanged});
   final String hintText ;
   final int maxLines;
   final void Function(String)? onChanged;
   final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty ?? true ){
          return 'field is required';
        }else {
          return null;
        }
        
      },
      maxLines: maxLines,
      cursorColor: Colors.white,
  decoration: InputDecoration(
    border:  OutlineInputBorder(
    ),
    hintText: hintText,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(10)
    ),
  ),
  );
  }
}