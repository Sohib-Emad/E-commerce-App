import 'package:eco/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category", style: AppStyles.category),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCategoryItem(
              'assets/icons/category1.png',
              'Apparel',
              const Color(0xFFEEF6FF),
            ),
            buildCategoryItem(
              'assets/icons/category2.png',
              'School',
              const Color(0xFFEBFAFF),
            ),
            buildCategoryItem(
              'assets/icons/category3.png',
              'Sports',
              const Color(0xFFFFEDDD),
            ),
            buildCategoryItem(
              'assets/icons/category4.png',
              'Electronic',
              const Color(0xFFFDECEA),
            ),
            buildCategoryItem(
              'assets/icons/category5.png',
              'All',
              const Color(0xFFE9FCF6),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCategoryItem(String imagePath, String categoryName, Color color) {
    return Column(
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: 32.r,
            height: 32.r,
          ),
        ),
        SizedBox(height: 8.h),
        Text(categoryName, style: AppStyles.categoryName),
      ],
    );
  }
}
