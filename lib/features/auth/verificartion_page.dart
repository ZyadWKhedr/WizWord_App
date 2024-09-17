import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/features/on_boarding/loading_content.dart';

class VerificationPage extends StatelessWidget {
  final String userName; // Add userName as a parameter

  const VerificationPage(
      {super.key, required this.userName}); // Constructor to accept userName

  Widget _buildVerificationText() {
    return const Column(
      children: [
        Text(
          'WizWords',
          style: TextStyle(
            color: mainColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 100),
        Text(
          'Verification',
          style: TextStyle(
            color: mainColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'We sent a verification code to your email',
          style: TextStyle(
            color: mainColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomButton(
      text: 'Sign Up',
      onPressed: () {
        Get.off(
          () => LoadingContent(userName: userName), // Pass userName here
          transition: Transition.native,
          duration: KTransitionDuration,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildVerificationText(),
              const SizedBox(height: 160),
              _buildSignUpButton(context),
              const SizedBox(height: 40),
              Image.asset('assets/images/girl1.png'),
            ],
          ),
        ),
      ),
    );
  }
}
