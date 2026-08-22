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

class HomeShoesNotifier extends Notifier<List<ProductItem>> {
  @override
  List<ProductItem> build() {
    return const [
      ProductItem(
        image: Assets.shoes1,
        title: 'Classic White Shoe',
        subtitle: 'Classic Cotton Shoe',
        price: '120.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.shoes2,
        title: 'Linen Summer Shoe',
        subtitle: 'Modern Fit Shoe',
        price: '130.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.shoes3,
        title: 'Oxford Formal Shoe',
        subtitle: 'Formal Style Shoe',
        price: '150.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.shoes4,
        title: 'Casual Everyday Shoe',
        subtitle: 'Casual Everyday Shoe',
        price: '160.00',
        isFavorite: false,
      ),
    ];
  }
}

class HomeBagsNotifier extends Notifier<List<ProductItem>> {
  @override
  List<ProductItem> build() {
    return const [
      ProductItem(
        image: Assets.bag1,
        title: 'Classic Leather Bag',
        subtitle: 'Premium Everyday Bag',
        price: '220.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.bag2,
        title: 'Weekend Travel Bag',
        subtitle: 'Smart Carry Bag',
        price: '240.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.bag3,
        title: 'Urban Tote Bag',
        subtitle: 'Modern Style Tote',
        price: '260.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.bag4,
        title: 'Mini Fashion Bag',
        subtitle: 'Compact Trend Bag',
        price: '280.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.bag5,
        title: 'Business Carry Bag',
        subtitle: 'Executive Utility Bag',
        price: '300.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.bag6,
        title: 'Luxury Handbag',
        subtitle: 'Elegant Signature Bag',
        price: '320.00',
        isFavorite: true,
      ),
    ];
  }
}

class HomeElectronicsNotifier extends Notifier<List<ProductItem>> {
  @override
  List<ProductItem> build() {
    return const [
      ProductItem(
        image: Assets.ele1,
        title: 'Smart Wireless Earbuds',
        subtitle: 'Premium Audio Device',
        price: '180.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.ele2,
        title: 'Bluetooth Speaker',
        subtitle: 'Portable Sound System',
        price: '210.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.ele3,
        title: 'Smart Watch',
        subtitle: 'Fitness and Connectivity',
        price: '240.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.ele4,
        title: 'Laptop Stand',
        subtitle: 'Ergonomic Desk Accessory',
        price: '260.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.ele5,
        title: 'USB-C Charger',
        subtitle: 'Fast Charging Adapter',
        price: '90.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.ele6,
        title: 'Gaming Mouse',
        subtitle: 'Precision Control Mouse',
        price: '120.00',
        isFavorite: true,
      ),
      ProductItem(
        image: Assets.ele7,
        title: '4K Webcam',
        subtitle: 'HD Streaming Camera',
        price: '200.00',
        isFavorite: false,
      ),
      ProductItem(
        image: Assets.ele8,
        title: 'Noise Cancelling Headset',
        subtitle: 'Comfortable Work Audio',
        price: '280.00',
        isFavorite: true,
      ),
    ];
  }
}

final homeProductsProvider =
    NotifierProvider<HomeProductsNotifier, List<ProductItem>>(
      HomeProductsNotifier.new,
    );

final homeShoesProvider =
    NotifierProvider<HomeShoesNotifier, List<ProductItem>>(
      HomeShoesNotifier.new,
    );

final homeBagsProvider = NotifierProvider<HomeBagsNotifier, List<ProductItem>>(
  HomeBagsNotifier.new,
);

final homeElectronicsProvider =
    NotifierProvider<HomeElectronicsNotifier, List<ProductItem>>(
      HomeElectronicsNotifier.new,
    );
