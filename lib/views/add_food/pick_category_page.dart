// In pick_category_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/food_controller.dart';

class PickCategoryPage extends StatelessWidget {
  PickCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Get.toNamed('/add-additives'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 16.h),
            _buildCategoriesList(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Food Categories', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h),
        Text('Select all that apply', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
      ],
    );
  }

  Widget _buildCategoriesList(FoodController controller) {
    return Expanded(
      child: Obx(() => ListView.builder(
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return CheckboxListTile(
            title: Text(category.name),
            value: category.isSelected,
            onChanged: (value) {
              controller.categories[index].isSelected = value!;
              controller.categories.refresh();
            },
          );
        },
      )),
    );
  }
}