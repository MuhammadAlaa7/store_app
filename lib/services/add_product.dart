import 'package:store_app/helper/api.dart';

import '../models/product.dart';

class AddProductService {
  static Future<Product> addProduct({
    required String title,
    required String description,
    required double price,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api.post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'description': description,
        'price': price,
        'image': image,
        'category': category,
      },
    );

    Product product = Product.fromJson(data);

    return product;
  }
}
