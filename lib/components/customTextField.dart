import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final TextInputType keboardType;
  final bool isPassword;
  final Color color;

  const customTextField(
      {key,
      required this.hinttext,
      required this.mycontroller,
      required this.keboardType,
      required this.isPassword,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: keboardType,
      controller: mycontroller,
      decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
          filled: true,
          fillColor: color),
    );
  }
}
