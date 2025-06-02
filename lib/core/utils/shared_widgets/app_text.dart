import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key, this.fontWeight});
  final String text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blue,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
