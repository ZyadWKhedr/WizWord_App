import 'package:flutter/material.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/levels/congrats_page.dart';
import 'package:wizwords/features/levels/level1/level1_page_content.dart';

// Example global variable for selected language (replace with actual implementation)
String userSelectedLanguage = 'Japanese'; // or 'Arabic', 'German'

class Level1Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level1PageContent(
      imagePath: AssetsData.car,
      japaneseWord: '車 (kuruma)',
      arabicWord: 'سيارة (sayyārah)',
      germanWord: 'Auto',
      nextPage: CongratsPage(),
      selectedLanguage: userSelectedLanguage,
    );
  }
}
