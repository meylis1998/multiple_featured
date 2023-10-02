import 'package:flutter/material.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
    super.key,
    required this.title,
    required this.body,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.backgroundColor,
    required this.appBarBackgroundColor,
    this.leading,
    this.action,
  });

  final Widget title;
  final Widget body;
  final Widget? leading, action;
  final double horizontalPadding, verticalPadding;
  final Color backgroundColor, appBarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: appBarBackgroundColor,
        toolbarHeight: 80,
        title: title,
        leading: leading,
        actions: [
          const SizedBox(width: 20),
          action ?? Container(),
        ],
      ),
      body: Container(
        color: backgroundColor,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: body,
      ),
    );
  }
}
