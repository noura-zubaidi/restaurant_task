import 'package:flutter/material.dart';
class IntroScreenThree extends StatelessWidget {
  const IntroScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/intro3.png',
            ),
            const Padding(padding: EdgeInsets.only(top:20 ),
              child: Text('Order Tracking',style: TextStyle(
                  color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold
              ),),),
            const Padding(padding: EdgeInsets.only(top:10 ),
              child: Text('Track your orders in real-time',style: TextStyle(
                color: Colors.deepOrange, fontSize: 18,
              ),),)
          ],
        )
    );
  }
}
