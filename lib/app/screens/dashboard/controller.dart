import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    debugPrint('changeTabIndex $index');
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 400),
    );
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }


}


