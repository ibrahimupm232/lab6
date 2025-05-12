import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/constants.dart';
import 'views/home/home_page.dart';
import 'views/add_food/add_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ibrahim restaurant',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: AppColors.primary,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: AppColors.secondary,
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: AppColors.primary,
              titleTextStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const HomePage()),
            GetPage(name: '/add-food', page: () => AddFoodPage()),
          ],
        );
      },
      child: const HomePage(),
    );
  }
}