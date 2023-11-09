import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products/get_products_cbutit.dart';
import '../widgets/category_item.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/products_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    AllProductsCubit cubit = BlocProvider.of<AllProductsCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            categoriesList(cubit.categories),
            const SizedBox(height: 30),
            const ProductsGridView(),
          ],
        ),
      ),
    );
  }

  Container categoriesList(List<Widget> categories) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return categories[index];
        },
        itemCount: 4,
      ),
    );
  }

  //                 ****    دي الطريقة القديمه من غير البلوك  ******
//   FutureBuilder<List<Product>> productsList() {
//     return FutureBuilder(
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           print('there is an erroreee ${snapshot.error}');
//         }
//         if (snapshot.hasData) {
//           return Padding(
//             padding: const EdgeInsets.only(
//               top: 50,
//             ),
//             child: GridView.builder(
//               shrinkWrap: true,
//               //  shrink >>> it makes the list view size is only as its contents size
//               // we use it to make the list as the height as their contents
//               // To make it one component so that it never scrolls.

//               physics: const NeverScrollableScrollPhysics(),
//               clipBehavior: Clip.none,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.5,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 100,
//               ),
//               itemBuilder: (context, index) {
//                 return ProductItem(product: snapshot.data![index]);
//               },
//               itemCount: snapshot.data!.length,
//             ),
//           );
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
}
