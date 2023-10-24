import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/view/add_product.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'New Trend',
      style: TextStyle(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddProductView.addProductViewId,
            );
          },
          icon: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.black,
          ))
    ],
  );
}
