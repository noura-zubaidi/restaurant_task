import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resturant_task/view/screens/splash_screens/splash_one.dart';
import 'package:resturant_task/view/screens/splash_screens/splash_three.dart';
import 'package:resturant_task/view/screens/splash_screens/splash_two.dart';
import 'package:resturant_task/view/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          }
        },
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                SplashOne(),
                SplashTwo(),
                SplashThree(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}