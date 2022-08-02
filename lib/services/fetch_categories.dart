import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/categories.dart';

// Fetch our Categories from API
Future<List<Category>> fetchCategories() async {
  const String apiUrl = "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // if the download is successful then parse the JSON.

    List<Category> categories = (json.decode(response.body) as List).map((data) => Category.fromJson(data)).toList();
    return categories;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
