// lib/common/background_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const BackgroundContainer({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColors.lightWhite,
        image: DecorationImage(
          image: AssetImage('assets/images/restaurant_bg.jpg'),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}