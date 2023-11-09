import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products/get_products_state.dart';
import 'package:store_app/models/product.dart';

import '../../services/all_products.dart';
import '../../services/product_by_category.dart';
import '../../widgets/category_item.dart';

class AllProductsCubit extends Cubit<AllProductsStates> {
  AllProductsCubit() : super(AllProductsInitialState()) {
    // call this method when excuting the super constructor
    // to ensure the list is initialized afterrrrrr the constructor
    _initCategories();
  }

  List<Product> productsList = [];

  List<Widget> categories = [];

  void _initCategories() {
    categories = [
      CategoryItem(
        onTap: () {
          productsByCategory('electronics');
        },
        image: 'assets/images/electronics.jpg',
        label: 'Electronics',
      ),
      CategoryItem(
        onTap: () {
          productsByCategory('jewelery');
        },
        image: 'assets/images/jewelry.jpg',
        label: 'Jewelery',
      ),
      CategoryItem(
        onTap: () {
          productsByCategory('men\'s clothing');
        },
        image: 'assets/images/men.jpg',
        label: 'Men\'s clothing',
      ),
      CategoryItem(
        onTap: () {
          productsByCategory('women\'s clothing');
        },
        image: 'assets/images/women.jpg',
        label: 'Women\'s clothing',
      ),
    ];
  }

  Future<void> getAllProducts() async {
    productsList = await AllProductsService.getAllProducts();
    emit(AllProductsSuccessState());
  }

  Future<void> productsByCategory(String categoryName) async {
    productsList = await ProductByCategoryService.getProductByCategory(
      categoryName: categoryName,
    );
    emit(AllProductsSuccessState());
    print('success');
  }
}
