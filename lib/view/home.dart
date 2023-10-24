import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/product_item.dart';

import '../services/all_products.dart';
import '../services/product_by_category.dart';
import '../widgets/category_item.dart';
import '../widgets/home_app_bar.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var future = AllProductsService.getAllProducts();

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryItem(
        onTap: () {
          setState(() {
            future = ProductByCategoryService.getProductByCategory(
              categoryName: 'electronics',
            );
          });
        },
        image: 'assets/images/electronics.jpg',
        label: 'Electronics',
      ),
      CategoryItem(
        onTap: () {
          setState(() {
            future = ProductByCategoryService.getProductByCategory(
              categoryName: 'jewelery',
            );
          });
        },
        image: 'assets/images/jewelry.jpg',
        label: 'Jewelry',
      ),
      CategoryItem(
        onTap: () {
          setState(() {
            future = ProductByCategoryService.getProductByCategory(
              categoryName: 'men\'s clothing',
            );
          });
        },
        image: 'assets/images/men.jpg',
        label: 'Men\'s clothing',
      ),
      CategoryItem(
        onTap: () {
          setState(() {
            future = ProductByCategoryService.getProductByCategory(
              categoryName: 'women\'s clothing',
            );
          });
        },
        image: 'assets/images/women.jpg',
        label: 'Women\'s clothing',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            categoriesList(categories),
            const SizedBox(height: 30),
            productsList(),
          ],
        ),
      ),
    );
  }

  Container categoriesList(List<Widget> categories) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return categories[index];
        },
        itemCount: 4,
      ),
    );
  }

  FutureBuilder<List<Product>> productsList() {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('there is an erroreee ${snapshot.error}');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              //  shrink >>> it makes the list view size is only as its contents size
              // we use it to make the list as the height as their contents
              // To make it one component so that it never scrolls.

              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return ProductItem(product: snapshot.data![index]);
              },
              itemCount: snapshot.data!.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
