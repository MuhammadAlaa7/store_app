import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products/get_products_state.dart';
import 'package:store_app/models/product.dart';

import '../../services/all_products.dart';
import '../../services/product_by_category.dart';

class AllProductsCubit extends Cubit<AllProductsStates> {
  AllProductsCubit() : super(AllProductsInitialState());

  List<Product> productsList = [];

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
