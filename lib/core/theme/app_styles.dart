import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  const AppStyles._();

  static final TextStyle subtitle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textSecondary,
  );

  static final TextStyle body = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textPrimary,
  );

  static final TextStyle sectionTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary,
  );

  static final TextStyle searchResult = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textPrimary,
  );

  static final TextStyle itemTitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textPrimary,
  );

  static final TextStyle appBarTitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.textPrimary,
  );
}
