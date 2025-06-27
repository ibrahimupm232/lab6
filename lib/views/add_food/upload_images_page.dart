import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/views/add_food/add_details_page.dart';
import '../../controllers/food_controller.dart';
import './add_details_page.dart';

class UploadImagesPage extends StatelessWidget {
  UploadImagesPage({super.key});

  final FoodController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Images'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 16.h),
            _buildImageGrid(),
            SizedBox(height: 16.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food Images', 
          style: TextStyle(
            fontSize: 18.sp, 
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Upload at least 2 images',
          style: TextStyle(
            fontSize: 14.sp, 
            color: Colors.grey
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return Expanded(
      child: Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => _handleImageTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: controller.tempImages.length > index
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        controller.tempImages[index],
                        fit: BoxFit.cover,
                      ),
                    )
                  : Center(child: Icon(Icons.add_a_photo, size: 40.w)),
            ),
          );
        }),
      )),
    );
  }

  Widget _buildActionButtons() {
    return Obx(() => Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text('Back'),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: controller.tempImages.length >= 2
                ? () => Get.to(() => AddDetailsPage())
                : null,
            child: const Text('Continue'),
          ),
        ),
      ],
    ));
  }

  void _handleImageTap(int index) {
    if (controller.tempImages.length <= index) {
      controller.tempImages.add('https://picsum.photos/300/300?random=$index');
    } else {
      // Optional: Allow replacing existing images
      controller.tempImages[index] = 'https://picsum.photos/300/300?random=$index-${DateTime.now().millisecondsSinceEpoch}';
    }
    controller.tempImages.refresh(); // Force UI update
  }
}