import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for routing
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/auth/information_page.dart';
import 'package:wizwords/features/languages/languages_pages.dart';
import 'package:wizwords/features/widgets/arrow_button.dart';
import 'package:wizwords/features/widgets/choice_chip.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  bool isSelected5To8 = false;
  bool isSelected9To12 = false;
  bool isSelected12To16 = false;
  bool isSelected16To20 = false;

  bool get isAgeSelected =>
      isSelected5To8 || isSelected9To12 || isSelected12To16 || isSelected16To20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsData.paperPlaneleft),
              const SizedBox(width: 16),
              Image.asset(
                AssetsData.logo,
                width: 135,
                height: 300,
              ),
              const SizedBox(width: 16),
              Image.asset(AssetsData.paperPlaneright),
            ],
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'How old are you?',
              style: TextStyle(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AgeChoiceChip(
                label: '5-8',
                isSelected: isSelected5To8,
                onSelected: (bool selected) {
                  setState(() {
                    isSelected5To8 = selected;
                    isSelected9To12 = false;
                    isSelected12To16 = false;
                    isSelected16To20 = false;
                  });
                },
              ),
              const SizedBox(width: 10),
              AgeChoiceChip(
                label: '9-12',
                isSelected: isSelected9To12,
                onSelected: (bool selected) {
                  setState(() {
                    isSelected9To12 = selected;
                    isSelected5To8 = false;
                    isSelected12To16 = false;
                    isSelected16To20 = false;
                  });
                },
              ),
              const SizedBox(width: 10),
              AgeChoiceChip(
                label: '12-16',
                isSelected: isSelected12To16,
                onSelected: (bool selected) {
                  setState(() {
                    isSelected12To16 = selected;
                    isSelected5To8 = false;
                    isSelected9To12 = false;
                    isSelected16To20 = false;
                  });
                },
              ),
              const SizedBox(width: 10),
              AgeChoiceChip(
                label: '16-20',
                isSelected: isSelected16To20,
                onSelected: (bool selected) {
                  setState(() {
                    isSelected16To20 = selected;
                    isSelected5To8 = false;
                    isSelected9To12 = false;
                    isSelected12To16 = false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ArrowButton(
                destinationPage: const InformationPage(),
                onPressed: isAgeSelected
                    ? () {
                        // Navigate using GetX routing
                        Get.to(() => const LanguagesPages(),
                            transition: Transition.native,
                            duration: KTransitionDuration);
                      }
                    : null, // Disable button if no age is selected
              ),
            ],
          ),
          const SizedBox(height: 70),
          Image.asset(AssetsData.ageImage),
        ],
      ),
    );
  }
}
