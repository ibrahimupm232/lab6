import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constants.dart';

class AddFoodForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;
  final TextEditingController priceController;
  final TextEditingController prepTimeController;
  final TextEditingController typeController;
  final VoidCallback onSave;

  const AddFoodForm({
    super.key,
    required this.titleController,
    required this.descController,
    required this.priceController,
    required this.prepTimeController,
    required this.typeController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          controller: titleController,
          label: 'Dish Name',
          icon: Icons.fastfood,
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: descController,
          label: 'Description',
          icon: Icons.description,
          maxLines: 3,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                controller: priceController,
                label: 'Price',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildTextField(
                controller: prepTimeController,
                label: 'Prep Time',
                icon: Icons.timer,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          controller: typeController,
          label: 'Category',
          icon: Icons.category,
        ),
        SizedBox(height: 32.h),
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(double.infinity, 56.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
          ),
          child: Text(
            'Save Dish',
            // style: AppTextStyles.button(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.gray),
        prefixIcon: Icon(icon, color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.grayLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}