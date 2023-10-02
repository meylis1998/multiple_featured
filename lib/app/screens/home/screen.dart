import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/core/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Text(
          'This is Home screen',
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
