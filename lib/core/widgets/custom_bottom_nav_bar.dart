import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _NavItem {
  const _NavItem({required this.image, required this.label});

  final String image;
  final String label;
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    _NavItem(image: AppImage.home, label: 'Home'),
    _NavItem(image: AppImage.heart, label: 'Wishlist'),
    _NavItem(image: AppImage.paper, label: 'History'),
    _NavItem(image: AppImage.profile, label: 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.navShadow,
            blurRadius: 12.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
          child: Row(
            children: [
              for (var index = 0; index < _items.length; index++)
                Expanded(child: _buildItem(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final item = _items[index];
    final isSelected = index == currentIndex;
    final color = isSelected ? AppColors.primary : AppColors.inactiveIcon;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            item.image,
            width: 28.r,
            height: 28.r,
            color: color,
            colorBlendMode: BlendMode.srcIn,
          ),
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: TextStyle(fontSize: 12.sp, color: color),
          ),
        ],
      ),
    );
  }
}
