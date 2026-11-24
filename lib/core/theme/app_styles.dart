import 'package:flutter/material.dart';

import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle homeheading1 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.homeheader1,
  );
  static TextStyle homeheading2 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.homeheader2,
  );
  static TextStyle category = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.homeheader2,
  );

  static TextStyle searchResult = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.homeheader2,
  );

  static TextStyle categoryName = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.homeheader2,
  );
}
