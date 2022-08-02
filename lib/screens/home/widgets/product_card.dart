import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';
import 'title_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  final Product product;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.image,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: product.image,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(text: product.title),
              ),
              SizedBox(height: defaultSize / 2),
              Text('\$${product.price}'),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
