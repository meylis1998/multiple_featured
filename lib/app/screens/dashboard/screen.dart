import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:test_app/app/core/themes/colors.dart';
import 'package:test_app/app/screens/calculator/screen.dart';
import 'package:test_app/app/screens/home/home.dart';
import 'package:test_app/app/screens/weather/screen.dart';

import '../../data/enums/enums.dart';
import 'controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    CalculatorScreen(),
    const WeatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('DASHBOARD PAGE');

    return GetX<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(controller.tabIndex.value),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ThemeColor.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: ThemeColor.black.withOpacity(.1),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: ThemeColor.white,
                  iconSize: 24,
                  textStyle: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    color: ThemeColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                  tabBorderRadius: 10,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 13,
                  ),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: ThemeColor.mainColor,
                  color: ThemeColor.navBarIconColor,
                  selectedIndex: controller.tabIndex.value,
                  onTabChange: (index) => controller.tabIndex.value = index,
                  tabs: [
                    GButton(
                      icon: controller.tabIndex.value == BottomNavbar.home.index ? Iconsax.home_25 : Iconsax.home_2,
                      text: 'Home',
                    ),
                    GButton(
                      icon: controller.tabIndex.value == BottomNavbar.calculator.index ? Iconsax.calculator5 : Iconsax.calculator,
                      text: 'Calculator',
                    ),
                    GButton(
                      icon: controller.tabIndex.value == BottomNavbar.weather.index ? Iconsax.cloud5 : Iconsax.cloud,
                      text: 'Weather',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
