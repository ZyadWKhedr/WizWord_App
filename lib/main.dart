import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/routes.dart';
import 'package:wizwords/features/auth/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await GetStorage.init(); // Initialize GetStorage

  // Register AuthController with GetX
  Get.put(AuthController());

  runApp(const WizWordsApp());
}

class WizWordsApp extends StatelessWidget {
  const WizWordsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: KPrimaryColor,
      ),
      initialRoute: '/splash',
      getPages: AppRoutes.routes,
    );
  }
}
