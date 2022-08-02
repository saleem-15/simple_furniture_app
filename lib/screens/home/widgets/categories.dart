import 'package:flutter/material.dart';

import '../../../models/categories.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) => CategoryCard(category: category)).toList(),
      ),
    );
  }
}
