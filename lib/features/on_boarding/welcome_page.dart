import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/first_page.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/second_page.dart';
import 'package:wizwords/features/on_boarding/welcome_pages/third_page.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: _controller,
              children: const [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const WormEffect(
                spacing: 8.0,
                dotHeight: 16.0,
                paintStyle: PaintingStyle.stroke,
                dotColor: Colors.grey,
                activeDotColor: mainColor),
          )
        ],
      ),
    );
  }
}
