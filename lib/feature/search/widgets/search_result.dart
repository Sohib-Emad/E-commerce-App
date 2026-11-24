import 'package:eco/core/data/products.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:eco/core/widgets/filter_button.dart';
import 'package:eco/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final query = searchQuery.trim().toLowerCase();
    final results = query.isEmpty
        ? AppProducts.items
        : AppProducts.items
              .where((product) => product.name.toLowerCase().contains(query))
              .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Search result for "$searchQuery"',
                style: AppStyles.searchResult,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            const FilterButton(),
          ],
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: results.isEmpty
              ? const Center(child: Text('No products found'))
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    mainAxisExtent: 240.h,
                  ),
                  itemCount: results.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: results[index]),
                ),
        ),
      ],
    );
  }
}
