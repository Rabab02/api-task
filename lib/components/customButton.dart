import 'package:flutter/material.dart';

class customButtons extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;
  final double width;
  const customButtons(
      {key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 15),
        ],
      ),
      width: width,
      child: MaterialButton(
          height: 40.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: color,
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
