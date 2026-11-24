import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  static const _colors = <Color>[
    Color(0xFFF0E2DF),
    Color(0xFFEBEBEB),
    Color(0xFFE5F0E0),
    Color(0xFFD9DFEC),
    Color(0xFF3D3D3F),
  ];

  static const _selectedColorIndex = 1;

  static const _description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
      'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim '
      'ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut '
      'aliquip ex ea commodo consequat. Duis aute irure dolor in '
      'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
      'pariatur.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const _Header(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      product.image,
                      height: 300.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TitleAndPrice(product: product),
                          SizedBox(height: 24.h),
                          Text(
                            'Choose the color',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xFF9A9A9A),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const _ColorPicker(),
                          SizedBox(height: 20.h),
                          Divider(height: 1.h, thickness: 1.h),
                          SizedBox(height: 20.h),
                          const _StoreRow(),
                          SizedBox(height: 20.h),
                          Divider(height: 1.h, thickness: 1.h),
                          SizedBox(height: 20.h),
                          const _DescriptionSection(),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 24.r, color: Color(0xFF333333)),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              'Product Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Image.asset('assets/icons/Buy.png', width: 28.r, height: 28.r),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}

class _TitleAndPrice extends StatelessWidget {
  const _TitleAndPrice({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    '\$ ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Text(
                      '( 219 people buy this )',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xFF9A9A9A),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 44.r,
          height: 44.r,
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.favorite_border,
            size: 22.r,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < ProductScreen._colors.length; index++) ...[
          if (index > 0) SizedBox(width: 10.w),
          Expanded(
            child: _ColorBox(
              color: ProductScreen._colors[index],
              isSelected: index == ProductScreen._selectedColorIndex,
            ),
          ),
        ],
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
        border: isSelected ? Border.all(color: Colors.white, width: 3.w) : null,
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0x1A000000),
                  blurRadius: 6.r,
                  offset: Offset(0, 2.h),
                ),
              ]
            : null,
      ),
    );
  }
}

class _StoreRow extends StatelessWidget {
  const _StoreRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: const Color(0xFF8C9BA5),
          child: Icon(Icons.apple, size: 28.r, color: Colors.white),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apple Store',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'online 12 mins ago',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF9A9A9A),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 100.w,
          height: 40.h,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF333333),
              side: BorderSide(color: const Color(0xFFE0E0E0), width: 1.w),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Text('Follow', style: TextStyle(fontSize: 14.sp)),
          ),
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description of product',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          ProductScreen._description,
          style: TextStyle(
            fontSize: 14.sp,
            height: 1.9,
            color: const Color(0xFF444444),
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFEEEEEE), width: 1.h),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            children: [
              const Expanded(
                child: _BottomButton(
                  label: 'Add to Cart',
                  backgroundColor: Color(0xFF7FC2A5),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(width: 12.w),
              const Expanded(
                child: _BottomButton(
                  label: 'Buy Now',
                  backgroundColor: Color(0xFFF0F1F1),
                  textColor: Color(0xFF333333),
                  showBorder: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.showBorder = false,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: showBorder
                ? BorderSide(color: const Color(0xFFE0E0E0), width: 1.w)
                : BorderSide.none,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
