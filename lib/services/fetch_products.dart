import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';


// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // if the download is successful then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
