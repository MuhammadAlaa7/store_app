import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/view/add_product.dart';
import 'package:store_app/view/home_view.dart';
import 'package:store_app/view/update_product.dart';

import 'cubits/products/get_products_cbutit.dart';

void main() {
  runApp(const MyApp());
//  AllProductsService.getAllProducts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProductsCubit()..getAllProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeView(),
          UpdateProductView.updateViewId: (context) => UpdateProductView(),
          AddProductView.addProductViewId: (context) => AddProductView(),
        },
        initialRoute: '/',
      ),
    );
  }
}
