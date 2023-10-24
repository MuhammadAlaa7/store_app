import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  static Future<List<String>> getAllCategories() async {
    List<dynamic> categories =
        await Api.get(url: 'https://fakestoreapi.com/products/categories');

    List<String> categoriesList =
        categories.map((category) => category.toString()).toList();
    // print(categoriesList[0]);
    return categoriesList;
  }
}
