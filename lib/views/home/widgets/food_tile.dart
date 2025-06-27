// In food_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/food_model.dart';
import '../../../constants/constants.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function(String)? onStatusChange;

  const FoodTile({
    super.key,
    required this.food,
    this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: AppDimensions.defaultPadding),
      elevation: AppDimensions.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: food.imageUrl,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.grayLight,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.title,
                          style: AppTextStyles.headline3(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          food.description,
                          style: AppTextStyles.bodyText2(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16.r, color: AppColors.gray),
                            SizedBox(width: 4.w),
                            Text(
                              food.preparationTime,
                              style: AppTextStyles.bodyText2(context),
                            ),
                            const Spacer(),
                            Text(
                              '\$${food.price.toStringAsFixed(2)}',
                              style: AppTextStyles.headline3(context).copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              if (onStatusChange != null) _buildStatusButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButtons(BuildContext context) {
    final statusOptions = ['New Orders', 'Preparing', 'Ready', 'Delivered'];
    final currentIndex = statusOptions.indexOf(food.status);
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: statusOptions.asMap().entries.map((entry) {
          final index = entry.key;
          final status = entry.value;
          final isCurrent = index == currentIndex;
          
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: ChoiceChip(
              label: Text(status),
              selected: isCurrent,
              onSelected: (selected) {
                if (selected && !isCurrent) {
                  onStatusChange?.call(status);
                }
              },
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isCurrent ? Colors.white : Colors.black,
                fontSize: 12.sp,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}