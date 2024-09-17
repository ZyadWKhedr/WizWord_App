import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Add padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AssetsData.group5, // Image asset
              ),
            ),
            const SizedBox(height: 30),
            _buildWelcomeText(), // Refactored welcome text as a separate method
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  // Refactor the welcome text into its own method
  Widget _buildWelcomeText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          color: mainColor,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: 'Hey there! Welcome to ',
          ),
          TextSpan(
            text: 'Wizwords',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ', where languages become adventures',
          ),
        ],
      ),
    );
  }
}
