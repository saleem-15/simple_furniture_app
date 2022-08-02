import 'package:flutter/material.dart';
import 'package:furniture_app/screens/details/product_details_screen.dart';

import '../../../models/product.dart';
import '../../../size_config.dart';
import 'product_card.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 3 : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
