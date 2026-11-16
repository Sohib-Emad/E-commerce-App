import 'dart:ui';

import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static  TextStyle homeheading1 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.homeheader1,
  );
  static  TextStyle homeheading2 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.homeheader2,
  );
}
