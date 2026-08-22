import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String products = '/products';
  static const String productDetails = '/products/:id';
  static const String cart = '/cart';
  static const String profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Home screen'))),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Login screen'))),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
