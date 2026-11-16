import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delivery address", style: AppStyles.homeheading1),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    "Salatiga City, Central Java",
                    style: AppStyles.homeheading2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.r,
                    color: AppColors.homeheader2,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Image.asset('assets/icons/Buy.png', width: 28.r, height: 28.r),
        SizedBox(width: 16.w),
        Image.asset('assets/icons/Notification.png', width: 28.r, height: 28.r),
      ],
    );
  }
}
