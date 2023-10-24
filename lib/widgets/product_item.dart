import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/view/update_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductView.updateViewId,
          arguments: product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title.substring(0, 15),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.price}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: 70,
            child: Image.network(
              product.image,
              height: 150,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
