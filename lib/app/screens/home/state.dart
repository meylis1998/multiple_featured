import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeState {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  RxBool obscureText = true.obs;
  Rx<IconData> visibilityIcon = Icons.visibility_off.obs;

  RxBool isLoading = false.obs;
}
