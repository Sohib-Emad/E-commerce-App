import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSearchSection extends StatelessWidget {
  const LastSearchSection({super.key});

  static const _items = [
    'Iphone 12 pro max',
    'Camera fujifilm',
    'Tripod Mini',
    'Bluetooth speaker',
    'Drawing pad',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Last search',
              style: TextStyle(fontSize: 18.sp, color: const Color(0xFF333333)),
            ),
            Text(
              'Clear all',
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFFD9534F)),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        for (final text in _items)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Icon(Icons.access_time, size: 24.r, color: Colors.grey),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF444444),
                    ),
                  ),
                ),
                Icon(Icons.close, size: 24.r, color: Colors.grey),
              ],
            ),
          ),
      ],
    );
  }
}