import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTile('Add Foods', Icons.fastfood),
          _buildTile('Wallet', Icons.wallet),
          _buildTile('Foods', Icons.restaurant),
          _buildTile('Deliveries', Icons.delivery_dining),
        ],
      ),
    );
  }

// In lib/views/home/widgets/home_tiles.dart
Widget _buildTile(String title, IconData icon) {
  return GestureDetector(
    onTap: () {
      if (title == 'Add Foods') {
        Get.toNamed('/add-food');
      }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primary, size: 30),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: AppColors.dark)),
      ],
    ),
  );
}
}