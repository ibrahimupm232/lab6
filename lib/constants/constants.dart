import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color primary = Color(0xFFE64A19);
  static const Color primaryLight = Color(0xFFFF8A65);
  static const Color primaryDark = Color(0xFFBF360C);
  static const Color secondary = Color(0xFFFFA000);
  static const Color secondaryLight = Color(0xFFFFD149);
  static const Color secondaryDark = Color(0xFFC67100);
  static const Color lightWhite = Color(0xFFFAFAFA);
  static const Color dark = Color(0xFF263238);
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

  static TextStyle headline2(BuildContext context) => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      );

  static TextStyle headline3(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      );

  static TextStyle bodyText1(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,
      );

  static TextStyle bodyText2(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray,
      );

  static TextStyle button(BuildContext context) => TextStyle(
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