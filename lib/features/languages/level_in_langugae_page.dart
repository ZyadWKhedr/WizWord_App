import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/features/auth/information_page.dart';

class LevelInLangugaePage extends StatelessWidget {
  const LevelInLangugaePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Wizwords at the top center
                const Text(
                  'Wizwords',
                  style: TextStyle(
                    color: mainColor, // Adjust color as needed
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 80),

                // Level prompt
                const Text(
                  'What’s your level in the language?',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),

                // Level buttons
                Column(
                  children: [
                    CustomButton(
                      width: 500,
                      text: 'Beginner',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      width: 500,
                      text: 'Intermediate',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      width: 500,
                      text: 'Fluent',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
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
                          onPressed: () {
                            // Navigate to LevelInLanguage using named routes
                            Get.off(() => const InformationPage(),
                                transition: Transition.native,
                                duration: KTransitionDuration);
                          },
                          icon: const Icon(FontAwesomeIcons.chevronRight),
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Image.asset(
                  AssetsData.kids,
                  height: 300,
                  width: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
