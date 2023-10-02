import 'package:flutter/material.dart';
import 'package:test_app/app/core/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('This is Home screen'),
      ),
    );
  }
}
