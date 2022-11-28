import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const String routeName = '/products';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
