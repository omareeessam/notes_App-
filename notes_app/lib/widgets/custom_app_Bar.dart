
import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  
  const CustomAppBar({super.key, required this.text, required this.icon, this.onPressed});
final String text;
final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(text,style: TextStyle(fontSize: 25),),
        SizedBox(width:200),
      Expanded(child: CustomSearchIcon(icon: icon,)),
      ],
    );
  }
}
