import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart'; // For Get.toNamed

class LoadingContent extends StatelessWidget {
  final String userName;

  const LoadingContent({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next page after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed('/home', parameters: {
        'userName': userName,
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Making the content \nthat fits you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: mainColor,
              ),
            ),
            const SizedBox(height: 70),
            LoadingAnimationWidget.twistingDots(
              size: 80,
              leftDotColor: mainColor,
              rightDotColor: Colors.black, // Adjust the size
            ),
            const SizedBox(height: 90),
            Image.asset(AssetsData.loading),
          ],
        ),
      ),
    );
  }
}
