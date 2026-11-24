import 'package:eco/core/theme/app_image.dart';
import 'package:eco/feature/home/model/product.dart';

class AppProducts {
  const AppProducts._();

  static const List<Product> items = [
    Product(
      image: AppImage.product1,
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
    Product(
      image: AppImage.product2,
      name: 'Aestechic Mug - white',
      price: 19.99,
    ),
    Product(
      image: AppImage.product3,
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
    Product(
      image: AppImage.product4,
      name: 'Monitor LG 22”inc 4K',
      price: 199.99,
    ),
  ];
}
