import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/features/auth/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile container with icon and username
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [mainColor, Colors.blue],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile icon
                  Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Username
                  Text(
                    authController.user?.displayName ?? 'Guest',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),

            // Display email
            _ProfileInfoCard(
              title: 'Email',
              content: authController.user?.email ?? 'Not available',
            ),
            const SizedBox(height: 30),

            // Display language being learned
            _ProfileInfoCard(
              title: 'Language Learning',
              content:
                  GetStorage().read<String>('selectedLanguage') ?? 'Not set',
            ),
            const SizedBox(height: 50),

            Center(
              child: CustomButton(
                text: 'Sign Out',
                onPressed: authController.signOut,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  final String title;
  final String content;

  const _ProfileInfoCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
