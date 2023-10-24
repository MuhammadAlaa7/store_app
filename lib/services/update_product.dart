import 'package:flutter/material.dart';

import '../helper/api.dart';
import '../models/product.dart';

class UpdatProductService {
  static Future<Product> updateProduct({
    required Product productData,
    // @required int? id,
    @required String? title,
    @required String? description,
    @required String? price,
    @required String? category,
  }) async {
    Map<String, dynamic> data = await Api.put(
      url: 'https://fakestoreapi.com/products/${productData.id}',
      body: {
        'id': productData.id.toString(),
        'title': title ?? productData.title,
        'description': description ?? productData.description,
        'price': price ?? productData.price.toString(),
        'image': productData.image,
        'category': productData.category,
      },
    );

    Product product = Product.fromJson(data);

    return product;
  }
}
