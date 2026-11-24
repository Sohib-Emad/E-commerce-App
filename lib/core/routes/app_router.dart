import 'package:eco/core/routes/app_routes.dart';
import 'package:eco/feature/home/home_screen.dart';
import 'package:eco/feature/home/model/product.dart';
import 'package:eco/feature/home/product_screen.dart';
import 'package:eco/feature/search/search_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppRoutes.productDetail:
        final product = settings.arguments;
        if (product is! Product) return null;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(product: product),
        );
    }

    return null;
  }
}
