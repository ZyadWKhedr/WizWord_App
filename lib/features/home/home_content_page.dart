import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';

class HomeContentPage extends StatelessWidget {
  final String userName;

  const HomeContentPage({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [secondaryColor, Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Wizwords',
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, $userName!',
                        style: const TextStyle(
                          color: mainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Continue where you left',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) {
                  return _buildLevelButton('Level ${index + 1}', index + 1);
                }),
              ),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Image.asset(AssetsData.learnNewWords),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelButton(String level, int levelNumber) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          final routeName = '/level${levelNumber}Page';
          // Navigate to the level page
          Get.toNamed(routeName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Center(
            child: Text(
              level,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
