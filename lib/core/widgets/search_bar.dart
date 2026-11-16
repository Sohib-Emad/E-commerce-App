import 'package:eco/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  const SearchBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
