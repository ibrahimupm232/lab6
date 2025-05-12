import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        labelColor: AppColors.lightWhite,
        unselectedLabelColor: AppColors.gray,
        tabs: const [
          Tab(text: 'New Orders'),
          Tab(text: 'Preparing'),
          Tab(text: 'Ready'),
          Tab(text: 'Delivered'),
        ],
      ),
    );
  }
}