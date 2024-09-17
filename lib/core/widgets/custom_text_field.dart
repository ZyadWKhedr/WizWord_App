import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60, // Set a fixed height to avoid shrinking
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            fillColor: secondaryColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
