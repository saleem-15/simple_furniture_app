import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.addToCart,
  }) : super(key: key);

  final Product product;
  final Function() addToCart;

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    return Container(
      constraints: BoxConstraints(
        minHeight: defaultSize * 44,
        maxWidth: SizeConfig.screenWidth,
      ),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultSize * 1.2),
            topRight: Radius.circular(defaultSize * 1.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subTitle,
            style: TextStyle(
              fontSize: defaultSize * 1.8,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultSize * 3),
          Text(
            product.description,
            style: TextStyle(
              height: 1.5,
              color: kTextColor.withOpacity(0.7),
            ),
          ),
          SizedBox(height: defaultSize * 3),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: addToCart,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                )),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
