import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Product> products = [];

    for (var item in jsonData) {
      products.add(Product(
          id: item["id"],
          title: item["title"],
          price: item["price"].toString(),
          image: item["image"],
          category: item["category"],
          rating: double.parse(item["rating"]["rate"].toString()),
          description: item["description"]));
    }
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

class Product {
  final int id;
  final String title;
  final String price;
  final String category;
  final String image;
  final double rating;
  final String description;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image,
      required this.rating,
      required this.description});

  // factory Products.fromJson(Map<String, dynamic> json) => Products(
  //       id: json['id'],
  //       title: json['title'],
  //       price: json['price'],
  //       // category: json['category'],
  //       // description: json['description'],
  //       image: json['image'],
  //       // rating: json['rating.rate'],
  //     );
}
