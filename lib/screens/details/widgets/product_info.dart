// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5, //375
      width: defaultSize * 15, //150
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product.category,
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          Text(
            product.subTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: defaultSize * 2.4, //24
            ),
          ),
          SizedBox(height: defaultSize * 3),
          Text(
            'From',
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          SizedBox(height: defaultSize),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: defaultSize * 1.6,
            ),
          ),
          SizedBox(height: defaultSize * 2),
          Text(
            'Available Colors',
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          Row(
            children: [
              buildColorBox(
                defaultSize,
                color: const Color(0xFF7BA275),
                isActive: true,
              ),
              buildColorBox(
                defaultSize,
                color: const Color(0xFFD7D7D7),
              ),
              buildColorBox(
                defaultSize,
                color: kTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize, {Color? color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : null,
    );
  }
}
