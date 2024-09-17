import 'package:flutter/material.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/levels/level1/level1_page3.dart';
import 'package:wizwords/features/levels/level1/level1_page_content.dart';

// Example global variable for selected language (replace with actual implementation)
String userSelectedLanguage = 'Japanese'; // or 'Arabic', 'German'

class Level1Page2 extends StatelessWidget {
  const Level1Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Level1PageContent(
      imagePath: AssetsData.shoes,
      japaneseWord: 'くつ, kutsu',
      arabicWord: 'حذاء (hiza)',
      germanWord: 'Schuhe',
      nextPage: Level1Page3(),
      selectedLanguage: userSelectedLanguage,
    );
  }
}
