import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zavora/generated/assets.dart';
import 'package:zavora/model/productItem_model.dart';

class HomeProductsNotifier extends Notifier<List<ProductItem>> {
  @override
  List<ProductItem> build() {
    return const [
      ProductItem(
        image: Assets.shirt1,
        title: 'Classic White Shirt',
        subtitle: 'Classic Cotton Shirt',
        price: '120.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.shirt2,
        title: 'Linen Summer Shirt',
        subtitle: 'Modern Fit Shirt',
        price: '130.00',
        isFavorite: true,
      ),

      ProductItem(
        image: Assets.shirt4,
        title: 'Oxford Formal Shirt',
        subtitle: 'Formal Style Shirt',
        price: '150.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.shirt5,
        title: 'Casual Everyday Shirt',
        subtitle: 'Casual Everyday Shirt',
        price: '160.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.shirt6,
        title: 'Executive Fit Shirt',
        subtitle: 'Office Smart Shirt',
        price: '170.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.dress1,
        title: 'Floral Evening Dress',
        subtitle: 'Elegant Evening Dress',
        price: '180.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.dress2,
        title: 'Silk Party Dress',
        subtitle: 'Party Style Dress',
        price: '190.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.dress3,
        title: 'Satin Classic Dress',
        subtitle: 'Classic Dress Design',
        price: '200.00',
        isFavorite: false,
      ),
    ];
  }
}

final homeProductsProvider =
    NotifierProvider<HomeProductsNotifier, List<ProductItem>>(
      HomeProductsNotifier.new,
    );
