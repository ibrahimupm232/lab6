// lib/views/home/homepage.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../food_list/food_list_page.dart';
import 'widgets/home_tiles.dart';
import 'widgets/order_tabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F6),
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
                      'Kings Foods',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'B74 (of South Street Union City, NJ 07087)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              background: Container(color: const Color(0xFFE64A19)),
            ),
          ),

          // Action Tiles Section
          SliverToBoxAdapter(
            child: HomeTiles(),
          ),

          // Order Tabs Section
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              OrderTabs(),
            ),
          ),

          // Content Area
          SliverFillRemaining(
            child: Center(
              child: Text(
                'No orders to display',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SliverAppBarDelegate(this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48.h;

  @override
  double get minExtent => 48.h;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}