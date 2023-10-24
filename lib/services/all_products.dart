import 'package:store_app/helper/api.dart';

import '../models/product.dart';

class AllProductsService {
  static Future<List<Product>> getAllProducts() async {
    List<dynamic> products =
        await Api.get(url: 'https://fakestoreapi.com/products');

    List<Product> productsList = [];

    products.map((product) {
      productsList.add(Product.fromJson(product));
    }).toList();
    print(productsList[4].title);
    return productsList;
  }
}
