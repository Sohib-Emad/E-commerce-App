import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144.w,
      height: 32.h,
      child: ElevatedButton(
        onPressed:  () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7DC4A5),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Text("Add to cart", style: TextStyle(fontSize: 13.sp)),
      ),
    );
  }
}
