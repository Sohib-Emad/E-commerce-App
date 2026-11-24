import 'package:eco/core/routes/app_routes.dart';
import 'package:eco/core/theme/app_image.dart';
import 'package:eco/core/widgets/app_search_field.dart';
import 'package:eco/feature/home/widgets/category.dart';
import 'package:eco/feature/home/widgets/header_app.dart';
import 'package:eco/feature/home/widgets/recent_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderApp(),
              SizedBox(height: 25.h),
              AppSearchField(
                readOnly: true,
                onTap: () => Navigator.pushNamed(context, AppRoutes.search),
              ),
              SizedBox(height: 25.h),
              Image.asset(AppImage.banner),
              SizedBox(height: 18.h),
              const CategoryWidget(),
              SizedBox(height: 20.h),
              const RecentProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
