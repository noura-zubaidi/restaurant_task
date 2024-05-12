import 'package:flutter/material.dart';
import 'package:resturant_task/view/screens/introduction_screens/intro_four.dart';
import 'package:resturant_task/view/screens/introduction_screens/intro_three.dart';
import 'package:resturant_task/view/screens/introduction_screens/intro_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introduction_screens/intro_one.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              IntroScreenOne(),
              IntroScreenTwo(),
              IntroScreenThree(),
              IntroScreenFour(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.51),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.deepOrange,
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: Colors.deepOrange,
                    expansionFactor: 3),
              )),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_currentPage != 3)
                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            fixedSize: const Size(270, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ),
                const SizedBox(height: 20),
                if (_currentPage != 3)
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(3);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 18),
                      )),
                if(_currentPage ==3)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          fixedSize: const Size(270, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );

                      },
                      child: const Text(
                        'Login/ Register',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
