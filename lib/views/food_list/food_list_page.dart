// lib/views/food_list/food_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhite,
      body: CustomScrollView(
        slivers: [
          // App Bar with restaurant info
          SliverAppBar(
            expandedHeight: 120.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(left: 16.w, bottom: 12.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food List',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              background: Container(color: AppColors.primary),
            ),
          ),

          // Horizontal Food List
          SliverPadding(
            padding: EdgeInsets.all(12.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final food = demoFoods[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: FoodTileHorizontal(food: food),
                  );
                },
                childCount: demoFoods.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Horizontal Food Tile Widget
class FoodTileHorizontal extends StatelessWidget {
  final Food food;

  const FoodTileHorizontal({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(12.r),
            ),
            child: Image.network(
              food.imageUrl,
              width: 100.w,
              height: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          
          // Food Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Name
                  Text(
                    food.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  
                  // Delivery Time
                  Text(
                    'Delivery time: ${food.deliveryTime} min',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  
                  // Additives
                  Wrap(
                    spacing: 6.w,
                    runSpacing: 6.h,
                    children: food.additives.map((additive) => Text(
                      additive,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[800],
                      ),
                    )).toList(),
                  ),
                  SizedBox(height: 8.h),
                  
                  // Price
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Food Model (same as before)
class Food {
  final String name;
  final String imageUrl;
  final int deliveryTime;
  final List<String> additives;
  final double price;

  Food({
    required this.name,
    required this.imageUrl,
    required this.deliveryTime,
    required this.additives,
    required this.price,
  });
}

// Sample Data (same as your image)
final List<Food> demoFoods = [
  Food(
    name: 'Tromaku',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 56,
    additives: ['Leningumi', 'Gollah', 'Mustapien', 'Chaste Goods', 'Sugar'],
    price: 17.10,
  ),
  Food(
    name: 'Spaghetti Carbonaro',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 20,
    additives: ['Fog', 'Anseldo', 'Rennison', 'Chasse', 'Black Paper', 'Arms'],
    price: 31.10,
  ),
  Food(
    name: 'Vegan Salad Bowl',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 56,
    additives: ['Mixed Creeds', 'Vestival', 'Orange', 'Cherry Tomatoes', 'Wheatrobe'],
    price: 31.15,
  ),
  Food(
    name: 'Margherita Pizza',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 30,
    additives: ['Chasse', 'Popcornet', 'Ketchup'],
    price: 37.13,
  ),
  Food(
    name: 'Tropical Fruit Smoothie',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 26,
    additives: ['Hungo', 'Honeycoil', 'Salmon Colored', 'Milk Mix'],
    price: 33.35,
  ),
  Food(
    name: 'Mixed Gall Hatter',
    imageUrl: 'https://www.cleankitchen.ee/cdn/shop/files/oyCtmVRSF59lqPmz-foynevLQ8nUy_AB-UfUUjB42co.jpg?crop=center&height=700&v=1727230358&width=1050',
    deliveryTime: 45,
    additives: ['Chicken', 'Steel', 'Lamb', 'Pink', 'Sweetous Sauce'],
    price: 41.55,
  ),
];