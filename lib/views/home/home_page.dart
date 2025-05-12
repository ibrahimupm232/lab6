// lib/views/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/constants.dart';
import '../../controllers/food_controller.dart';
import 'widgets/food_tile.dart';
import 'widgets/home_tiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController foodController = Get.put(FoodController());
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.h,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 0,
                backgroundColor: AppColors.primary,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Gourmet Restaurant',
                      style: TextStyle(fontSize: 18.sp)),
                  background: Image.network(
                    'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.secondary,
                    labelColor: AppColors.secondary,
                    unselectedLabelColor: Colors.white70,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    tabs: [
                      Tab(text: 'New Orders'),
                      Tab(text: 'Preparing'),
                      Tab(text: 'Ready'),
                      Tab(text: 'Delivered'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildFoodList(context, 'New Orders'),
              _buildFoodList(context, 'Preparing'),
              _buildFoodList(context, 'Ready'),
              _buildFoodList(context, 'Delivered'),
            ],
          ),
        ),
      ),
     // In your home_page.dart, update the FAB to use named routing:
floatingActionButton: FloatingActionButton(
  onPressed: () => Get.toNamed('/add-food'),  // Use named route
  backgroundColor: AppColors.secondary,
  child: const Icon(Icons.add, color: Colors.white),
).animate().scale(delay: 300.ms),
    );
  }

  Widget _buildFoodList(BuildContext context, String category) {
    return Obx(() {
      final foods = Get.find<FoodController>().foods;
      return ListView.builder(
        padding: EdgeInsets.all(AppDimensions.defaultPadding),
        itemCount: foods.length,
        itemBuilder: (context, index) => FoodTile(food: foods[index])
            .animate()
            .fadeIn(delay: (100 * index).ms)
            .slideX(begin: 0.1),
      );
    });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.primary,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}