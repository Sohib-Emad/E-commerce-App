import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:eco/core/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product {
  const Product({required this.image, required this.name, required this.price});

  final String image;
  final String name;
  final double price;
}

class SearchResult extends StatelessWidget {
  final String searchQuery;
  const SearchResult({super.key , this.searchQuery = ""});

  static const _products = [
    Product(
      image: 'assets/images/image 1.png',
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
    Product(
      image: 'assets/images/image 2.png',
      name: 'Aestechic Mug - white',
      price: 19.99,
    ),
    Product(
      image: 'assets/images/image 3.png',
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
    Product(
      image: 'assets/images/image 4.png',
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search result for \"$searchQuery\"", style: AppStyles.searchResult),
            Container(
              height: 27.h,
              width: 78.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.grey, width: 1.w),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Filters", style: AppStyles.categoryName),
                  Image.asset(
                    'assets/icons/Filter 2.png',
                    width: 10.r,
                    height: 10.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            mainAxisExtent: 240.h, // fixed card height
          ),
          itemBuilder: (context, index) =>
              ProductCard(product: _products[index]),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onAddToCart});

  final Product product;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0D000000),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            child: Image.asset(
              product.image,
              height: 112.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyles.categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text("\$${product.price}", style: AppStyles.category),
                SizedBox(height: 12.h),
                const AddToCart(), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
