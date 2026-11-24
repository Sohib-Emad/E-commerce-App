import 'package:eco/core/routes/app_routes.dart';
import 'package:eco/core/theme/app_colors.dart';
import 'package:eco/core/theme/app_styles.dart';
import 'package:eco/core/widgets/add_to_cart.dart';
import 'package:eco/feature/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onAddToCart});

  final Product product;
  final VoidCallback? onAddToCart;

  String get formattedPrice => '\$${product.price.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(8.r);

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.productDetail,
        arguments: product,
      ),
      borderRadius: BorderRadius.all(radius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.all(radius),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: radius),
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
                    style: AppStyles.itemTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(formattedPrice, style: AppStyles.sectionTitle),
                  SizedBox(height: 12.h),
                  AddToCart(onPressed: onAddToCart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
