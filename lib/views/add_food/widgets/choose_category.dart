// lib/views/add_food/widgets/choose_category.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/views/add_food/upload_images_page.dart';

class ChooseCategory extends StatelessWidget {
  ChooseCategory({super.key});

  final FoodController foodController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button at the top left
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 24.w,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Welcome to Restaurant Panel',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Fill all the required info to cast food items',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              Text(
                'Pick Category',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Tap on a category to select it',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(() => ListView.separated(
                  itemCount: foodController.categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final category = foodController.categories[index];
                    return Card(
                      color: category.isSelected 
                          ? Theme.of(context).primaryColor.withOpacity(0.2)
                          : null,
                      child: ListTile(
                        onTap: () {
                          // Clear all selections first
                          for (var c in foodController.categories) {
                            c.isSelected = false;
                          }
                          // Select the tapped category
                          category.isSelected = true;
                          foodController.categories.refresh();
                          
                          // Update tempFood with selected category
                          if (foodController.tempFood != null) {
                            foodController.tempFood = foodController.tempFood!.copyWith(
                              categories: [category.name],
                            );
                          }
                          
                          // Proceed to upload images page
                          Get.to(() => UploadImagesPage());
                        },
                        title: Text(category.name),
                        trailing: category.isSelected
                            ? Icon(Icons.check_circle, color: Theme.of(context).primaryColor)
                            : null,
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}