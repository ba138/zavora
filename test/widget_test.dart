import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zavora/features/home/screens/product_detail_screen.dart';
import 'package:zavora/generated/assets.dart';
import 'package:zavora/model/productItem_model.dart';

void main() {
  testWidgets('ProductDetailScreen shows selected product details', (
    WidgetTester tester,
  ) async {
    const product = ProductItem(
      image: Assets.shirt1,
      title: 'Classic White Shirt',
      subtitle: 'Classic Cotton Shirt',
      price: '120.00',
      isFavorite: false,
    );

    await tester.pumpWidget(
      const MaterialApp(home: ProductDetailScreen(product: product)),
    );

    expect(find.text('Classic White Shirt'), findsOneWidget);
    expect(find.text('Classic Cotton Shirt'), findsOneWidget);
    expect(find.text('\$120.00'), findsOneWidget);
  });
}
