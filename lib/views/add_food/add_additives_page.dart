// In add_additives_page.dart
import 'package:flutter/material.dart';
import '../../../models/additive_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:restaurant_app/models/additive_model.dart';
import '../../controllers/food_controller.dart';
// import '../../widgets/additive_item.dart';
import '../add_food/widgets/additive_item.dart';
import '../../../../models/additive_model.dart';
class AddAdditivesPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  AddAdditivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Additives'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Get.toNamed('/upload-images'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildInputSection(controller),
            SizedBox(height: 16.h),
            _buildAdditivesList(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(FoodController controller) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Additive', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.h),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Additive Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                prefixText: '\$',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: _addAdditive,
              child: const Text('Add Additive'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditivesList(FoodController controller) {
    return Expanded(
      child: Obx(() => ListView.builder(
        itemCount: controller.tempAdditives.length,
        itemBuilder: (context, index) {
          return AdditiveItem(
            additive: controller.tempAdditives[index],
            onDelete: () => controller.tempAdditives.removeAt(index),
          );
        },
      )),
    );
  }

void _addAdditive() {
  if (titleController.text.isEmpty || priceController.text.isEmpty) return;
  
  final FoodController controller = Get.find();
  controller.tempAdditives.add(
    Additive(  // Make sure this matches your class name exactly
      title: titleController.text,
      price: double.parse(priceController.text),
    ),
  );
  titleController.clear();
  priceController.clear();
}
}