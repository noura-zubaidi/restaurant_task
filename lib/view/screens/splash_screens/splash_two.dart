import 'package:flutter/material.dart';

class SplashTwo extends StatelessWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.deepOrange,
      body: Center(
        child:Image.network(
          'https://static.vecteezy.com/system/resources/thumbnails/024/958/957/small_2x/hand-drawn-vintage-fire-logo-in-flat-style-png.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
