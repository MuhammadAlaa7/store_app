import 'package:flutter/material.dart';
import 'package:store_app/view/add_product.dart';
import 'package:store_app/view/home.dart';
import 'package:store_app/view/update_product.dart';

import 'services/all_products.dart';

void main() {
  runApp(const MyApp());
//  AllProductsService.getAllProducts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeView(),
        UpdateProductView.updateViewId: (context) => UpdateProductView(),
        AddProductView.addProductViewId: (context) => AddProductView(),
      },
      initialRoute: '/',
    );
  }
}
