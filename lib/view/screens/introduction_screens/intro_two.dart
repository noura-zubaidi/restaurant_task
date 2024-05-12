import 'package:flutter/material.dart';
class IntroScreenTwo extends StatelessWidget {
  const IntroScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/intro2.png',
            ),
            Padding(padding: EdgeInsets.only(top:20 ),
              child: Text('Fast Delivery',style: TextStyle(
                  color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold
              ),),),
            Padding(padding: EdgeInsets.only(top:10 ),
              child: Text('Receive goods after 10 minutes',style: TextStyle(
                color: Colors.deepOrange, fontSize: 18,
              ),),)
          ],
        )
    );
  }
}
