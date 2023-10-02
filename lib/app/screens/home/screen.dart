import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/core/themes/colors.dart';
import 'package:test_app/app/global/global.dart';

import '../../core/utils/mask.dart';
import 'controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseApp(
      horizontalPadding: 30,
      verticalPadding: 40,
      backgroundColor: ThemeColor.white,
      appBarBackgroundColor: ThemeColor.white,
      title: Text(
        'Form validator',
        style: Get.textTheme.bodyMedium,
      ),
      body: GetX<HomeController>(
        init: HomeController(),
        builder: (hc) => SingleChildScrollView(
          child: Form(
            key: hc.state.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your name',
                  style: Get.textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                MyTextFormField(
                  label: 'Your name',
                  hintText: 'enter your name here',
                  inputType: TextInputType.text,
                  controller: hc.state.nameCtrl,
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone',
                  style: Get.textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  label: 'Phone',
                  isPhone: true,
                  prefix: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 8),
                    child: Text(
                      '+993 ',
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: ThemeColor.black.withOpacity(0.7),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  hintText: '6x xxxxxx',
                  inputType: TextInputType.number,
                  inputFormatters: [maskFormatterPhone],
                  controller: hc.state.phoneCtrl,
                ),
                const SizedBox(height: 20),
                Text(
                  'Password',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  label: 'enter your password here',
                  controller: hc.state.pwdCtrl,
                  suffix: InkWell(
                    onTap: hc.onVisibilityChange,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(
                        hc.state.visibilityIcon.value,
                        color: ThemeColor.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  obscureText: hc.state.obscureText.value,
                ),
                const SizedBox(height: 32),
                hc.state.isLoading.value
                    ? const CustomLoader()
                    : ButtonWidthFull(
                        callback: hc.onSubmitTapped,
                        title: 'Submit',
                        side: ThemeColor.mainColor,
                        backgroundColor: ThemeColor.mainColor,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
