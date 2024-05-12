import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:resturant_task/view/screens/onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {

          if (details.primaryDelta! < -20) {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            );
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'asset/images/img.png',
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SPEEDY CHOW',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}