// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/views/home/home_page.dart';
import 'package:restaurant_app/views/add_food/widgets/choose_category.dart';
import 'package:restaurant_app/views/food_list/food_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Restaurant Panel',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.white,
          ),
          initialBinding: BindingsBuilder(() {
            Get.put(FoodController(), permanent: true);
          }),
          home: const HomePage(),
          getPages: [
            GetPage(
              name: '/add-food/category',
              page: () => ChooseCategory(),
            ),
            GetPage(
              name: '/food-list',
              page: () => FoodListPage(),
            ),
          ],
        );
      },
    );
  }
}