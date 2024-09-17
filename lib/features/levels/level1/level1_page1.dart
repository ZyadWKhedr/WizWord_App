import 'package:flutter/material.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/levels/level1/level1_page2.dart';
import 'package:wizwords/features/levels/level1/level1_page_content.dart';

// Example global variable for selected language (replace with actual implementation)
String userSelectedLanguage = 'Japanese'; // or 'Arabic', 'German'

class Level1Page1 extends StatelessWidget {
  const Level1Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Level1PageContent(
      imagePath: AssetsData.orangeJuice,
      japaneseWord: 'オレンジジュース (orenji jūsu)',
      arabicWord: 'عصير برتقال (asir burtuqal)',
      germanWord: 'Orangensaft',
      nextPage: Level1Page2(),
      selectedLanguage: userSelectedLanguage,
    );
  }
}
