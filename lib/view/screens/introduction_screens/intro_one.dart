import 'package:flutter/material.dart';
class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/images/img_1.png',
          ),
          Padding(padding: EdgeInsets.only(top:20 ),
          child: Text('Wide Selection',style: TextStyle(
            color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold
          ),),),
          Padding(padding: EdgeInsets.only(top:10 ),
            child: Text('More than 400 restaurants nationwide',style: TextStyle(
                color: Colors.deepOrange, fontSize: 18,
            ),),)
        ],
      )
    );
  }
}
