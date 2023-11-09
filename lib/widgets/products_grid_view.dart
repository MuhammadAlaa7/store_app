import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/widgets/product_item.dart';

import '../cubits/products/get_products_cbutit.dart';
import '../cubits/products/get_products_state.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsStates>(
      builder: (context, state) {
        AllProductsCubit cubit = BlocProvider.of<AllProductsCubit>(context);
        return Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            //  shrink >>> it makes the list view size is only as its contents size
            // we use it to make the list as the height as their contents
            // To make it one component so that it never scrolls.

            physics: const NeverScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (context, index) {
              return ProductItem(product: cubit.productsList[index]);
            },
            itemCount: cubit.productsList.length,
          ),
        );
      },
    );
  }
}
