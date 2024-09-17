import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Optional width
  final double? height; // Optional height

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Initialize optional width
    this.height, // Initialize optional height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use the provided width if available
      height: height, // Use the provided height if available
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(mainColor), // Button background color
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 102.0)), // Button padding
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}
