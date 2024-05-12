import 'package:flutter/material.dart';
import 'package:resturant_task/view/screens/home_screen.dart';
import 'package:resturant_task/view/screens/location_map.dart';
import 'package:resturant_task/view/screens/login_screen.dart';
import 'package:resturant_task/view/screens/onboarding_screen.dart';
import 'package:resturant_task/view/screens/profile_screen.dart';
import 'package:resturant_task/view/screens/signup_screen.dart';
import 'package:resturant_task/view/screens/special_offers.dart';
import 'package:resturant_task/view/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
