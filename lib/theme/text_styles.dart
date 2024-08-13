import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/theme/theme.dart';

class TextStyles {
  // Global
  static const appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const instructionTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const textFieldFloatingLabelTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static TextStyle primaryButtonTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    color: MeasureTheme.primaryButtonTextColor,
  );
}
