import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controlller;
  final String hintText;
  final String labelText;
  final IconData prefixIconData;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  const CustomTextField({Key ? key, required this.controlller,
   required this.hintText, required this. labelText,
    required this.prefixIconData, this.suffixIcon, required this.validator,  this.obscureText = false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controlller,
      decoration: InputDecoration(
        hintText: hintText,
         labelText: labelText,
         prefixIcon: Icon(prefixIconData),
         suffixIcon: suffixIcon
      ) ,
    );
  }
}