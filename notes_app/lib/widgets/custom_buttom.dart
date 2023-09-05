
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,this.onTap,this.isloading = false});
final void Function()? onTap;
final bool isloading ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 320,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(6)
          ),
          child:isloading ? CircularProgressIndicator():  Text('Add',style: TextStyle(color: Colors.black),
          ),
        ),
    );
  }
}