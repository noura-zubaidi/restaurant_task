import 'package:flutter/material.dart';
class IntroScreenFour extends StatelessWidget {
  const IntroScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/intro4.png',
            ),
            const Padding(padding: EdgeInsets.only(top:20 ),
              child: Text('Special Offers',style: TextStyle(
                  color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold
              ),),),
            const Padding(padding: EdgeInsets.only(top:10 ),
              child: Text('Weekly deals and discounts',style: TextStyle(
                color: Colors.deepOrange, fontSize: 18,
              ),),),
            SizedBox(height: 20,),

          ],
        )
    );
  }
}
