import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final Color textcolor;
final Color bgcolor;
final String buttonText;

  const MyButton({super.key, required this.textcolor, required this.bgcolor, required this.buttonText,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: bgcolor,
          child: Center(
            child: Text(buttonText,style: TextStyle(color: textcolor),),
          ),
        ),
      ),
    );
  }
}