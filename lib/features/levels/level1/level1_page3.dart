import 'package:flutter/material.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/features/levels/level1/level1_page4.dart';
import 'package:wizwords/features/levels/level1/level1_page_content.dart';

// Example global variable for selected language (replace with actual implementation)
String userSelectedLanguage = 'Japanese'; // or 'Arabic', 'German'

class Level1Page3 extends StatelessWidget {
  const Level1Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Level1PageContent(
      imagePath: AssetsData.school,
      japaneseWord: '学校 (gakkō)',
      arabicWord: 'مدرسة (madrasah)',
      germanWord: 'Schule',
      nextPage: Level1Page4(),
      selectedLanguage: userSelectedLanguage,
    );
  }
}
