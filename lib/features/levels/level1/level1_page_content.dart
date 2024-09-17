import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';

class Level1PageContent extends StatelessWidget {
  final String imagePath;
  final String japaneseWord;
  final String arabicWord;
  final String germanWord;
  final Widget nextPage;
  final String selectedLanguage;

  const Level1PageContent({
    super.key,
    required this.imagePath,
    required this.japaneseWord,
    required this.arabicWord,
    required this.germanWord,
    required this.nextPage,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    String displayWord;

    // Determine which word to display based on the selected language
    switch (selectedLanguage) {
      case 'Arabic':
        displayWord = arabicWord;
        break;
      case 'German':
        displayWord = germanWord;
        break;
      case 'Japanese':
      default:
        displayWord = japaneseWord;
        break;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [secondaryColor, Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Wizwords',
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 195, 78, 211)
                          .withOpacity(0.7),
                      offset: const Offset(6, -5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Image.asset(imagePath),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Do you know this word?',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [mainColor, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  displayWord,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: mainColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 80),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: mainColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 80),
                    ),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Image.asset(AssetsData.yesOrNo)),
          ],
        ),
      ),
    );
  }
}
