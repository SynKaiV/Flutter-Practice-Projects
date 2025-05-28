import 'package:flutter/material.dart';

class calculatorButton extends StatelessWidget {
  final String text;
  final Color ? buttonColor;
  final Color ? fontColor;
  final VoidCallback onClick;

  const calculatorButton({
    super.key,
    required this.onClick,
    required this.text,
    this.buttonColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1, // Makes the button square
          child: GestureDetector(
            onTap: onClick,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the button round
                color: buttonColor
              ),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: fontColor
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}