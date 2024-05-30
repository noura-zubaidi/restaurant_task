import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_task/data/hive_helper.dart';
import 'package:resturant_task/repo/categories_services.dart';
import 'package:resturant_task/repo/special_offers_services.dart';
import 'package:resturant_task/view/screens/home_screen.dart';

import 'package:resturant_task/view/screens/splash_screen.dart';
import 'package:resturant_task/view_model/categories_provider.dart';
import 'package:resturant_task/view_model/special_offers_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final dio = Dio();
  final webServices = WebServices(dio);
  final categoriesServices = CategoriesServices(dio);

  final hiveHelper = HiveHelper();
  final rememberedPhone = await hiveHelper.getRememberedUser();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              SpecialOffersProvider(webServices)..fetchSpecialOffers(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              CategoriesProvider(categoriesServices)..fetchCategories(),
        )
      ],
      child: MyApp(rememberedPhone: rememberedPhone),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? rememberedPhone;

  MyApp({Key? key, this.rememberedPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: rememberedPhone == null ? const SplashScreen() : const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
