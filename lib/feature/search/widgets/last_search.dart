import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSearchSection extends StatelessWidget {
  const LastSearchSection({
    super.key,
    required this.items,
    required this.onSelected,
    required this.onRemoved,
    required this.onCleared,
  });

  final List<String> items;
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onRemoved;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Last search', style: AppStyles.sectionTitle),
            TextButton(
              onPressed: onCleared,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.red,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              child: Text('Clear all', style: AppStyles.body),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        for (final text in items)
          _HistoryItem(
            text: text,
            onSelected: () => onSelected(text),
            onRemoved: () => onRemoved(text),
          ),
      ],
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({
    required this.text,
    required this.onSelected,
    required this.onRemoved,
  });

  final String text;
  final VoidCallback onSelected;
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: InkWell(
        onTap: onSelected,
        child: Row(
          children: [
            Icon(Icons.access_time, size: 24.r, color: Colors.grey),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, size: 24.r, color: Colors.grey),
              onPressed: onRemoved,
            ),
          ],
        ),
      ),
    );
  }
}
