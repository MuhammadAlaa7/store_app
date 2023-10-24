import 'package:flutter/material.dart';
import 'package:store_app/services/update_product.dart';

import '../models/product.dart';
import '../widgets/input_field.dart';

class UpdateProductView extends StatelessWidget {
  UpdateProductView({super.key});

  static String updateViewId = ' update id ';

  String? title;
  String? description;
  String? price;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Update Product',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(
                onChanged: (data) {
                  title = data;
                },
                labelText: 'Product Name',
                hint: 'Enter Product to update',
              ),
              InputField(
                onChanged: (data) {
                  description = data;
                },
                labelText: 'Description',
                hint: 'Enter Description to update',
              ),
              InputField(
                textInputType: TextInputType.phone,
                onChanged: (data) {
                  price = data;
                },
                labelText: 'Price',
                hint: 'Enter Price to update',
              ),
              InputField(
                onChanged: (data) {
                  ///////////////////////////////////////////////////////
                },
                labelText: 'Image',
                hint: 'Enter Image to update',
              ),
              GestureDetector(
                onTap: () {
                  UpdatProductService.updateProduct(
                    productData: product,
                    title: title,
                    description: description,
                    price: price,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
