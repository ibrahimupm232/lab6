import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../models/additive_model.dart';
import '../../../models/additive_model.dart';


class AdditiveItem extends StatelessWidget {
  final Additive additive;
  final VoidCallback onDelete;

  const AdditiveItem({
    super.key,
    required this.additive,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        title: Text(additive.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('\$${additive.price.toStringAsFixed(2)}'),
            SizedBox(width: 8.w),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}