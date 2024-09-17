import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/features/widgets/facebook_google.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered image
            Center(
              child: Image.asset(AssetsData.group6),
            ),
            const SizedBox(height: 30),

            // RichText for account creation message
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(text: 'Unleash the full '),
                  TextSpan(
                    text: 'Wizwords ',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'experience - Create your account today!'),
                ],
              ),
            ),
            const SizedBox(height: 60),

            // Custom button for account creation
            CustomButton(
              text: 'Create an account',
              onPressed: () {
                Get.toNamed(
                  '/age', // Using named route for AgePage
                  arguments: {},
                );
              },
            ),
            const SizedBox(height: 20),

            // Already have an account? Login link
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: teritaryColor),
                ),
                const SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      '/login', // Using named route for LoginPage
                      arguments: {},
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Facebook and Google sign-in options
            const FacebookGoogle(),
          ],
        ),
      ),
    );
  }
}
