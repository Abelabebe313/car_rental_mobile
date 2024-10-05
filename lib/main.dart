import 'package:car_rental_app/core/theme/app_theme_data.dart';
import 'package:car_rental_app/features/Onbording/presentation/pages/onbording_screen.dart';
import 'package:flutter/material.dart';

import 'features/Onbording/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      debugShowCheckedModeBanner: false,
      theme: appThemeData(context),
      home: const Splash(),
    );
  }
}
