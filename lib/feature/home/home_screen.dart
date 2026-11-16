import 'package:eco/core/theme/app_image.dart';
import 'package:eco/core/widgets/search_bar.dart';
import 'package:eco/feature/home/widgets/category.dart';
import 'package:eco/feature/home/widgets/header_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderApp(),
              SizedBox(height: 25.h),
              const SearchBar2(),
              SizedBox(height: 25.h),
              Image.asset(AppImage.banner1),
              SizedBox(height: 18.h),
              const CategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
