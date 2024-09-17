import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.destinationPage,
    required this.onPressed,
  });

  final Widget destinationPage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: mainColor,
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: onPressed, // Use the passed onPressed callback
          icon: const Icon(FontAwesomeIcons.chevronRight),
          color: mainColor,
        ),
      ),
    );
  }
}
