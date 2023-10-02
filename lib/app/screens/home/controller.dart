import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/screens/home/state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void onVisibilityChange() {
    state.obscureText.value = !state.obscureText.value;
    state.visibilityIcon.value = state.obscureText.value ? Icons.visibility_off : Icons.visibility;
  }

  Future<void> onSubmitTapped() async {
    debugPrint('onSubmitTapped');
    FocusManager.instance.primaryFocus?.unfocus();
    if (state.formKey.currentState!.validate()) {}
  }
}
