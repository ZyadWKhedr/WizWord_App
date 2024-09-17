import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wizwords/const.dart';

class LanguagesPages extends StatelessWidget {
  const LanguagesPages({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the controller here
    final LanguagesController controller = Get.put(LanguagesController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
            const SizedBox(height: 70),
            const Text(
              'Choose the language you \nwant to learn:',
              style: TextStyle(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView(
                  children: [
                    _buildLanguageContainer(controller, 'German'),
                    _buildLanguageContainer(controller, 'Arabic'),
                    _buildLanguageContainer(controller, 'French'),
                    _buildLanguageContainer(controller, 'Japanese'),
                  ],
                );
              }),
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
                        Get.toNamed('/level_in_language');
                      },
                      icon: const Icon(FontAwesomeIcons.chevronRight),
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageContainer(
      LanguagesController controller, String language) {
    final isSelected = controller.selectedLanguage.value == language;

    return GestureDetector(
      onTap: () => controller.toggleLanguage(language),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? mainColor : secondaryColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          language,
          style: TextStyle(
            color: isSelected ? Colors.white : mainColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LanguagesController extends GetxController {
  final box = GetStorage(); // GetStorage instance

  // Observable to hold the selected language
  var selectedLanguage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the stored language when the app starts
    selectedLanguage.value = box.read('selectedLanguage') ?? '';
  }

  // Toggle language selection
  void toggleLanguage(String language) {
    if (selectedLanguage.value == language) {
      selectedLanguage.value = ''; // Deselect language
      box.remove('selectedLanguage'); // Remove from storage
    } else {
      selectedLanguage.value = language; // Select new language
      box.write('selectedLanguage', language); // Save to storage
    }
  }
}
