import 'package:flutter/material.dart';

class SplashThree extends StatelessWidget {
  const SplashThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ///  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/024/958/957/small_2x/hand-drawn-vintage-fire-logo-in-flat-style-png.png',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 100),
            Padding(padding: EdgeInsets.all(10),
            child: Text('SPEEDY CHOW',style: TextStyle(color: Colors.white,fontSize: 25,
                fontWeight: FontWeight.bold),),),
            Padding(padding: EdgeInsets.only(bottom: 40),
              child: Text('version 2.1.0', style: TextStyle(color: Colors.white, fontSize: 18),)),
          ],
        ),
      ),
    );
  }
}
