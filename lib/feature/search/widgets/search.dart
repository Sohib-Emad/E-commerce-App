import 'package:eco/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarText extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const SearchBarText({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.homeheader2,
      decoration: InputDecoration(
        hintText: 'Search here ...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}
