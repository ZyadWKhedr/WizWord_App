import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding for consistency
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AssetsData.group3, // Image asset
              ),
            ),
            const SizedBox(
                height: 30), // Add spacing between the image and text
            _buildText(), // Refactored text into a separate method
          ],
        ),
      ),
    );
  }

  // Refactor the text into its own method
  Widget _buildText() {
    return const Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0), // Added horizontal padding
      child: Text(
        'Meet your language learning buddies! Choose your favorite!',
        style: TextStyle(
          fontSize: 20,
          color: mainColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
