import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/widgets/custom_button.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class RestaurantRegistrationPage extends StatelessWidget {
  const RestaurantRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController postalCodeController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Restaurant Registration'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Upload Logo',
                      style: AppTextStyles.bodyText1(context),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.add_a_photo, size: 40.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Upload Cover',
                      style: AppTextStyles.bodyText1(context),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 200.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.add_a_photo, size: 40.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Text('Restaurant Title', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: titleController,
                hintText: 'Enter restaurant title',
              ),
              SizedBox(height: 24.h),
              Text('Business Hours', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: timeController,
                hintText: 'e.g. 08:00 AM - 10:00 PM',
              ),
              SizedBox(height: 24.h),
              Text('Postal Code', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: postalCodeController,
                hintText: 'Enter postal code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 24.h),
              Text('Address', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: addressController,
                hintText: 'Enter restaurant address',
                maxLines: 3,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'ADD RESTAURANT',
                onPressed: () {
                  // Here you would normally save the restaurant data
                  // For now, just navigate to home page
                  Get.offAllNamed('/home');
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}