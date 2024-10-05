import 'package:car_rental_app/features/BottomNavigation/presentation/pages/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onbording_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkValidity();
  }

  void checkValidity() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isVisitedBefore = pref.getBool('visited');

    if (isVisitedBefore == null || isVisitedBefore == false) {
      pref.setBool('visited', true);
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnbordingScreen(),
          ),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                      height: 180,
                      width: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
