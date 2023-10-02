import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/core/colors.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Text(
          'This is Weather screen',
          style: Get.textTheme.bodyMedium?.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ThemeColor.mainColor,
          ),
        ),
      ),
    );
  }
}
