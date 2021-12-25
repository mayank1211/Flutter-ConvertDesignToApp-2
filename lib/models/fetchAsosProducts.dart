import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Products> fetchProducts(int? randomNumber) async {
  var productNumber = randomNumber != null ? randomNumber : 1;

  final response = await http
      .get(Uri.parse('https://fakestoreapi.com/products/${productNumber}'));

  if (response.statusCode == 200) {
    var decoded = Products.fromJson(jsonDecode(response.body));
    return decoded;
  } else {
    throw Exception('Failed to load products');
  }
}

class Products {
  final int id;
  final String title;
  final double price;
  // final String category;
  final String image;
  // final String rating;
  // final String description;

  Products({
    required this.id,
    required this.title,
    required this.price,
    // required this.category,
    required this.image,
    // required this.rating,
    // required this.description
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        // category: json['category'],
        // description: json['description'],
        image: json['image'],
        // rating: json['rating.rate'],
      );
}
