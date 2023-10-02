import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/themes/colors.dart';

final txtStyle = TextStyle(color: ThemeColor.black.withOpacity(0.7), fontSize: 16);

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final int maxLines;
  final bool obscureText;
  final bool isPhone;
  final bool isPassword;
  final TextInputType inputType;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChangeCallback;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.maxLines = 1,
    this.obscureText = false,
    this.isPhone = false,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.suffix,
    this.prefix,
    this.inputFormatters,
    this.onChangeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      cursorColor: ThemeColor.black,
      style: txtStyle,
      keyboardType: inputType,
      inputFormatters: inputFormatters != null ? [...inputFormatters!] : [],
      textInputAction: TextInputAction.done,
      decoration: inputDecoration(),
      validator: (value) => _validator(value),
      onChanged: (value) => onChangeCallback != null ? onChangeCallback!(value) : null,
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      alignLabelWithHint: maxLines != 1,
      hintText: hintText ?? label,
      hintStyle: txtStyle,
      prefixIcon: prefix,
      suffixIcon: suffix,
      // prefixIconConstraints: const BoxConstraints(),
      suffixIconConstraints: const BoxConstraints(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: ThemeColor.mainColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: ThemeColor.grey.withOpacity(0.4)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: ThemeColor.red),
      ),
      // disabledBorder: InputBorder.none,
    );
  }

  String? _validator(String? value) {
    if (isPassword) {
      return value!.length < 8 ? 'Пароль должен быть минимум 8 символов'.tr : null;
    }
    if (obscureText) {
      return (value == null || value.trim().length < 8) ? 'Минимум 8 символов'.tr : null;
    }
    if (isPhone) {
      final phone = value?.replaceAll(RegExp(r'\D+'), '');
      return (phone == null || phone.trim().length < 10) ? 'Неверный формат номера телефона'.tr : null;
    }

    return (value == null || value.trim().isEmpty) ? 'Это поле обязательно к заполнению'.tr : null;
  }
}
