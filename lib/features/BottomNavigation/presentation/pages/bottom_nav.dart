import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/colors/colors.dart';
import '../../../Cars/presentation/pages/car_main.dart';
import '../../../Home/presentation/pages/home_main.dart';
import '../../../Orders/presentation/pages/order_main.dart';
import '../../../Profile/presentation/pages/profile_main.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 2, // Default to Home
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController.dispose();
    super.dispose();
  }

  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Notification',
    ),
    const CarListingScreen(),
    const HomeScreen(),
    const OrderMainScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.lightPrimary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: ThemeColors.primary,
              radius: 25,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 23,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit
                        .cover, // Ensures the image fills the circular area
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_motionTabBarController.index),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        labels: const ["Notification", "Cars", "Home", "Orders", "Profile"],
        icons: const [
          Ionicons.notifications_outline,
          Ionicons.car_sport,
          Ionicons.home_outline,
          Ionicons.key_outline,
          Ionicons.person_outline,
        ],
        badges: const [
          // Default Motion Badge Widget
          MotionBadgeWidget(
            text: '10+',
            textColor: Colors.white,
            color: Colors.red,
            size: 18,
          ),
          null,
          null,
          null,
          null,
        ],
        tabSize: 45,
        tabBarHeight: 60,
        textStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: ThemeColors.lightPrimary,
        ),
        tabIconColor: ThemeColors.lightPrimary,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: ThemeColors.lightPrimary,
        tabIconSelectedColor: ThemeColors.primary,
        tabBarColor: ThemeColors.primary,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController.index = value;
          });
        },
      ),
    );
  }
}
