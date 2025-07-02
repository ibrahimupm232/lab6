import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/auth_controller.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/views/auth/login_page.dart';
import 'package:restaurant_app/views/auth/registration_page.dart';
import 'package:restaurant_app/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Restaurant Panel',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialBinding: AppBinding(),
          home: const LoginPage(),
          getPages: [
            GetPage(
              name: '/login',
              page: () => const LoginPage(),
              binding: BindingsBuilder.put(() => AuthController()),
            ),
            GetPage(
              name: '/registration', 
              page: () => const RegistrationPage(),
            ),
            GetPage(
              name: '/home',
              page: () => const HomePage(),
            ),
          ],
        );
      },
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.put<FoodController>(FoodController(), permanent: true);
  }
}