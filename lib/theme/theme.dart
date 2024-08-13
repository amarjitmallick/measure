import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/theme/text_styles.dart';

class MeasureTheme {
  static const primaryColor = Color(0xFF7333DB);
  static const secondaryColor = Color(0xFFD8E8F0);
  static const tertiaryColor = Color(0xFF3382A0);

  // TabBar Theme
  static const indicatorColor = Color(0xFF7333DB);
  static const tabBarBackgroundColor = Color(0xFFD8E8F0);
  static const selectedLabelColor = Color(0xFFD8E8F0);
  static const unselectedLabelColor = Color(0xFF3382A0);

  // Text Field Theme
  static const focusedBorderColor = Color(0xFF7333DB);
  static const borderColor = Color(0xFF3382A0);
  static const errorBorderColor = Color(0xFFCB0000);

  //Button Theme
  static const primaryButtonColor = Color(0xFF7333DB);
  static const primaryButtonTextColor = Color(0xFFD8E8F0);
}

InputDecoration textFieldInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    label: Text(labelText),
    floatingLabelStyle: TextStyles.textFieldFloatingLabelTextStyle,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: MeasureTheme.borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: MeasureTheme.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: MeasureTheme.focusedBorderColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: MeasureTheme.errorBorderColor,
      ),
    ),
  );
}
