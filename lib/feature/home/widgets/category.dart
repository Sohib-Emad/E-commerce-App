import 'package:eco/core/theme/app_image.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _Category {
  const _Category({
    required this.icon,
    required this.name,
    required this.color,
  });

  final String icon;
  final String name;
  final Color color;
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  static const _categories = [
    _Category(
      icon: AppImage.categoryApparel,
      name: 'Apparel',
      color: Color(0xFFEEF6FF),
    ),
    _Category(
      icon: AppImage.categorySchool,
      name: 'School',
      color: Color(0xFFEBFAFF),
    ),
    _Category(
      icon: AppImage.categorySports,
      name: 'Sports',
      color: Color(0xFFFFEDDD),
    ),
    _Category(
      icon: AppImage.categoryElectronic,
      name: 'Electronic',
      color: Color(0xFFFDECEA),
    ),
    _Category(
      icon: AppImage.categoryAll,
      name: 'All',
      color: Color(0xFFE9FCF6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: AppStyles.sectionTitle),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final category in _categories)
              Expanded(child: _CategoryItem(category: category)),
          ],
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.category});

  final _Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Image.asset(
            category.icon,
            fit: BoxFit.contain,
            width: 32.r,
            height: 32.r,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.name,
          style: AppStyles.itemTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
