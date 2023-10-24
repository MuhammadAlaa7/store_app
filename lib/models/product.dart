class Product {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  //final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    //  required this.rating,
  });

  factory Product.fromJson(json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      // rating: Rating.fromJson(json['rating']),
    );
  }
}

// class Rating {
//   final num? rate;
//   final int count;

//   Rating({
//     required this.rate,
//     required this.count,
//   });

//   factory Rating.fromJson(json) {
//     return Rating(
//       rate: json['rate'],
//       count: json['count'],
//     );
//   }
// }
