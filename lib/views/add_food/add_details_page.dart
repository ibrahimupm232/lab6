// lib/views/add_food/add_details_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/views/food_list/food_list_page.dart';

class AddDetailsPage extends StatelessWidget {
  AddDetailsPage({super.key});

  final FoodController foodController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController prepTimeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
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
              
              // Header text
              Text(
                'Welcome Foodly',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Fill the required info to add food items',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 24.h),
              
              // Add Details Section
              Text(
                'Add Details',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                'You are required fill all the details fully with the correct information',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16.h),
              
              // Form Fields
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description of the food item',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: prepTimeController,
                        decoration: InputDecoration(
                          labelText: 'Preparation time e.g 25 min',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 24.h),
                      
                      // Food Type Section
                      Text(
                        'Add FoodType',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'You are required fill all the details fully with the correct information',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                labelText: 'Breakfast / Lunch / Dinner',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          ElevatedButton(
                            onPressed: () {
                              if (typeController.text.isNotEmpty) {
                                foodController.addFoodType(typeController.text);
                                typeController.clear();
                              }
                            },
                            child: Text('ADD TYPE'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      
                      // Selected Types
                      Obx(() => Wrap(
                        spacing: 8.w,
                        children: foodController.foodTypes.map((type) => Chip(
                          label: Text(type),
                          onDeleted: () => foodController.removeFoodType(type),
                        )).toList(),
                      )),
                    ],
                  ),
                ),
              ),
              
              // Navigation Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text('BACK'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save all details to controller
                        foodController.tempFood = foodController.tempFood?.copyWith(
                          title: titleController.text,
                          description: descriptionController.text,
                          preparationTime: prepTimeController.text,
                          price: double.tryParse(priceController.text) ?? 0.0,
                          types: foodController.foodTypes.toList(),
                        );
                        
                        // Navigate to next page or finish
                        Get.offAll(() => FoodListPage());
                      },
                      child: Text('FINISH'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}