import 'package:get/get.dart';
import 'package:wizwords/features/auth/create_account_page.dart';
import 'package:wizwords/features/auth/information_page.dart';
import 'package:wizwords/features/auth/login_page.dart';
import 'package:wizwords/features/auth/verificartion_page.dart';
import 'package:wizwords/features/home/home_page.dart';
import 'package:wizwords/features/languages/languages_pages.dart';
import 'package:wizwords/features/languages/level_in_langugae_page.dart';
import 'package:wizwords/features/levels/level1/level1_page1.dart';
import 'package:wizwords/features/levels/level2_page.dart';
import 'package:wizwords/features/levels/level3.dart';
import 'package:wizwords/features/levels/level4.dart';
import 'package:wizwords/features/levels/level5.dart';
import 'package:wizwords/features/on_boarding/loading_content.dart';
import 'package:wizwords/features/on_boarding/welcome_page.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/first_page.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/second_page.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/third_page.dart';
import 'package:wizwords/features/profile/profile_page.dart';
import 'package:wizwords/features/splash_view/splash_view.dart';
import 'package:wizwords/features/user_information/age_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashView()),
    GetPage(name: '/welcome', page: () => WelcomePage()),
    GetPage(name: '/first', page: () => const FirstPage()),
    GetPage(name: '/second', page: () => const SecondPage()),
    GetPage(name: '/third', page: () => const ThirdPage()),
    GetPage(name: '/age', page: () => const AgePage()),
    GetPage(name: '/create-account', page: () => const CreateAccountPage()),
    GetPage(name: '/enter-info', page: () => const InformationPage()),
    GetPage(name: '/languages', page: () => const LanguagesPages()),
    GetPage(name: '/level_in_language', page: () => LevelInLangugaePage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(
      name: '/verification',
      page: () {
        final userName = Get.parameters['userName'] ?? '';
        return VerificationPage(userName: userName);
      },
    ),
    GetPage(
      name: '/home',
      page: () {
        return HomePage();
      },
    ),
    GetPage(
      name: '/content',
      page: () {
        final userName = Get.parameters['userName'] ?? '';
        return LoadingContent(userName: userName);
      },
    ),
    GetPage(name: '/profile', page: () => const ProfilePage()),
    GetPage(name: '/level1Page', page: () => Level1Page1()),
    GetPage(name: '/level2Page', page: () => Level2Page()),
    GetPage(name: '/level3Page', page: () => Level3()),
    GetPage(name: '/level4Page', page: () => Level4()),
    GetPage(name: '/level5Page', page: () => Level5()),
  ];
}
