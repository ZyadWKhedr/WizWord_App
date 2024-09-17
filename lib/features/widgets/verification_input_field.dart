// verification_input_field.dart
import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class VerificationInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  const VerificationInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: mainColor, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: mainColor, fontSize: 24, fontWeight: FontWeight.w600),
          maxLength: 1, // allows only 1 digit per box
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "", // hides the counter for maxLength
          ),
        ),
      ),
    );
  }
}
