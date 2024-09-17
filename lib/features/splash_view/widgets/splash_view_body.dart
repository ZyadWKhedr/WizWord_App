import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/auth/auth_controller.dart';
import 'package:wizwords/features/home/home_page.dart';
import 'package:wizwords/features/on_boarding/welcome_page.dart';
import 'package:wizwords/features/splash_view/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateBasedOnAuthStatus();
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free resources
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teritaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AssetsData.logo,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    // Initialize the AnimationController
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Set appropriate duration
    );

    // Initialize the sliding animation
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

    // Start the animation
    animationController.forward();
  }

  void navigateBasedOnAuthStatus() {
    Future.delayed(const Duration(seconds: 2), () {
      final AuthController authController = Get.find();

      if (authController.user == null) {
        // User is not logged in, navigate to the welcome page
        Get.offAll(() => WelcomePage(),
            transition: Transition.fade, duration: KTransitionDuration);
      } else {
        // User is logged in, navigate to the home page
        Get.offAll(() => HomePage(),
            transition: Transition.fade, duration: KTransitionDuration);
      }
    });
  }
}
