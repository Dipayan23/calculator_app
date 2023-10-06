import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color textcolor;
  final Color bgcolor;
  final String buttonText;
  final buttonTapped;

  const MyButton({
    super.key,
    required this.textcolor,
    required this.bgcolor,
    required this.buttonText,
    this.buttonTapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: bgcolor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
