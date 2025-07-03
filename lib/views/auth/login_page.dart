import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/auth_controller.dart';
import 'package:restaurant_app/widgets/custom_button.dart';
import 'package:restaurant_app/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final isPasswordVisible = false.obs;

    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Text(
                  'Foodly Restaurant Panel',
                  style: AppTextStyles.headline1(context),
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text(
                  'DELIVERY SERVICE',
                  style: AppTextStyles.bodyText2(context),
                ),
              ),
              SizedBox(height: 60.h),
              Obx(() => authController.errorMessage.value.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Text(
                        authController.errorMessage.value,
                        style: AppTextStyles.bodyText1(context).copyWith(
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              Text('Email', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              Text('Password', style: AppTextStyles.bodyText1(context)),
              SizedBox(height: 8.h),
              Obx(
                () => CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: !isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible.value 
                          ? Icons.visibility 
                          : Icons.visibility_off,
                      color: AppColors.gray,
                    ),
                    onPressed: () => isPasswordVisible.toggle(),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: AppTextStyles.bodyText2(context),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/registration'),
                    child: Text(
                      'Register',
                      style: AppTextStyles.bodyText2(context).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
          Obx(
  () => CustomButton(
    text: 'LOGIN',
    onPressed: authController.isLoggedIn.value
        ? () {} // Empty function instead of null
        : () {
            authController.login(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
                 if (authController.isLoggedIn.value) {
              Get.offAllNamed('/restaurant-registration');
            }
          },
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}