import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/auth/create_account_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetsData.group4,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text:
                        'Spark a Lifelong Love of Languages in Your Child with ',
                  ),
                  TextSpan(
                    text: 'Wizwords',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
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
                      Get.to(() => CreateAccountPage(),
                          transition: Transition.circularReveal,
                          duration: KTransitionDuration);
                    },
                    icon: const Icon(FontAwesomeIcons.chevronRight),
                    color: mainColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
