import 'package:store_app/helper/api.dart';
import '../models/product.dart';

class ProductByCategoryService {
  static Future<List<Product>> getProductByCategory(
      {required String categoryName}) async {
    List<dynamic> categoryProducts = await Api.get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<Product> productsList = [];

    categoryProducts.map((product) {
      productsList.add(Product.fromJson(product));
    }).toList();
    print(productsList[0].category);
    return productsList;
  }
}
