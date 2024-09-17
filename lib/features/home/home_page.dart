import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/features/auth/auth_controller.dart';
import 'package:wizwords/features/home/home_content_page.dart';
import 'package:wizwords/features/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController authController = Get.find();

  int _currentIndex = 0; // Track the currently selected index

  @override
  Widget build(BuildContext context) {
    final userName = authController.user?.displayName ?? 'Guest';

    final List<Widget> _pages = [
      HomeContentPage(userName: userName),
      const ProfilePage(),
    ];

    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
      ),
    );
  }
}
