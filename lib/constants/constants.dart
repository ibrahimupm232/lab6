import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color primary = Color.fromARGB(155, 233, 12, 12);
  static const Color primaryLight = Color(0xFF60AD5E);
  static const Color primaryDark = Color(0xFF005005);
  static const Color secondary = Color(0xFFFFC107);
  static const Color secondaryLight = Color(0xFFFFF350);
  static const Color secondaryDark = Color(0xFFC79100);
  static const Color lightWhite = Color(0xFFFAFAFA);
  static const Color dark = Color.fromARGB(255, 38, 45, 56);
  static const Color gray = Color(0xFF90A4AE);
  static const Color grayLight = Color(0xFFECEFF1);
  static const Color red = Color(0xFFEF5350);
  static const Color background = Color(0xFFF5F5F6);
}

class AppTextStyles {
  static TextStyle headline1(BuildContext context) => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.dark,
      );

  static TextStyle get headline2 => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      );
       static TextStyle headline3(BuildContext context) => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      );

  static TextStyle get bodyText1 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,
      );

  static TextStyle get bodyText2 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray,
      );

  static TextStyle get button => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}

class AppDimensions {
  static double get defaultPadding => 16.w;
  static double get smallPadding => 8.w;
  static double get borderRadius => 12.r;
  static double get cardElevation => 4;
}