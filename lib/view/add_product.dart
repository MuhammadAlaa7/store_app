import 'package:flutter/material.dart';
import '../widgets/input_field.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});

  static String addProductViewId = ' add product id ';

  String title = '';
  String description = '';
  double price = 0.0;
  String category = '';
  String image = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add Product',
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
                hint: 'Enter Product to add',
              ),
              InputField(
                onChanged: (data) {
                  description = data;
                },
                labelText: 'Description',
                hint: 'Enter Description to add',
              ),
              InputField(
                textInputType: TextInputType.phone,
                onChanged: (data) {
                  price = double.parse(data);
                },
                labelText: 'Price',
                hint: 'Enter Price to add',
              ),
              InputField(
                onChanged: (data) {
                  image = data;
                  ///////////////////////////////////////////////////////
                },
                labelText: 'Image',
                hint: 'Enter Image to add',
              ),
              GestureDetector(
                onTap: () {
                  // AddProductService.addProduct(
                  //   title: title,
                  //   description: description,
                  //   price: price,
                  //   image: image,
                  //   category: category,
                  // ).then((value) {
                  //   print(value.category);
                  // });
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
                    'Add',
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
