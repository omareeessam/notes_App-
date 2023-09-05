

import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onPressed});
final IconData icon;
 final void Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(.05),
      borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: IconButton(
onPressed: onPressed,
          icon:Icon(icon) 
          ),
      ),
    );
  }
}