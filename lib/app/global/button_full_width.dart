import 'package:flutter/material.dart';

import '../core/themes/colors.dart';

class ButtonWidthFull extends StatelessWidget {
  final String title;
  final Color txtColor, backgroundColor, side;
  final VoidCallback? callback;

  const ButtonWidthFull({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.side,
    required this.callback,
    this.txtColor = ThemeColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            (RoundedRectangleBorder(
              side: BorderSide(color: side),
              borderRadius: BorderRadius.circular(8.0),
            )),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: callback != null ? () => callback!() : null,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
