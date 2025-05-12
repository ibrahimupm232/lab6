import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';
import '../../controllers/food_controller.dart';
import '../../models/food_model.dart';
import 'widgets/add_food_form.dart';

class AddFoodPage extends StatelessWidget {
  AddFoodPage({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController prepTimeController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Dish', style: AppTextStyles.headline3(context)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dish Details',
                // style: AppTextStyles.headline1(context),
              ),
              SizedBox(height: 16.h),
              AddFoodForm(
                titleController: titleController,
                descController: descController,
                priceController: priceController,
                prepTimeController: prepTimeController,
                typeController: typeController,
                onSave: () {
                  if (_validateForm()) {
                    final newFood = Food(
                      id: DateTime.now().toString(),
                      title: titleController.text,
                      description: descController.text,
                      price: double.tryParse(priceController.text) ?? 0,
                      preparationTime: prepTimeController.text,
                      types: [typeController.text],
                      additives: [],
                      imageUrl: 'https://source.unsplash.com/random/300x300/?food',
                    );
                    foodController.addFood(newFood);
                    Get.back();
                    Get.snackbar(
                      'Success',
                      '${newFood.title} added to menu',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.primary,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter a title');
      return false;
    }
    if (priceController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter a price');
      return false;
    }
    return true;
  }
}