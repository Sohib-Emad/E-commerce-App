import 'package:eco/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _NavItem {
  const _NavItem({
    required this.image,
    required this.activeIcon,
    required this.label,
  });

  final String image;
  final String activeIcon;
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
    _NavItem(
      image: 'assets/icons/Home.png',
      activeIcon: 'assets/icons/Home.png',
      label: 'Home',
    ),
    _NavItem(
      image: 'assets/icons/Heart.png',
      activeIcon: 'assets/icons/Heart.png',
      label: 'Wishlist',
    ),
    _NavItem(
      image: 'assets/icons/Paper.png',
      activeIcon: 'assets/icons/Paper.png',
      label: 'History',
    ),
    _NavItem(
      image: 'assets/icons/Profile.png',
      activeIcon: 'assets/icons/Profile.png',
      label: 'Account',
    ),
  ];

  static const _inactiveColor = Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x0F000000),
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
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final isSelected = index == currentIndex;
              final color = isSelected ? AppColors.greenSheen : _inactiveColor;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        isSelected ? item.image : item.image,
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
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}