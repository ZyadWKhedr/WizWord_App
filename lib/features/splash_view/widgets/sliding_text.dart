import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class SlidingText extends StatelessWidget {
  final Animation<Offset> slidingAnimation;

  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'WizWords',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42,
              color: mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
