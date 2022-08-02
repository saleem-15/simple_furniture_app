// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:furniture_app/size_config.dart';

import '../../constants.dart';
import '../../models/product.dart';
import 'widgets/product_description.dart';
import 'widgets/product_info.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow-long-left.svg'),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/bag.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight - AppBar().preferredSize.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ProductInfo(product: product),
                Positioned(
                  bottom: 0,
                  child: ProductDescription(
                    product: product,
                    addToCart: () {},
                  ),
                ),
                Positioned(
                  top: defaultSize * 9,
                  left: defaultSize * 10,
                  child: Hero(
                    tag: product.image,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      width: defaultSize * 37.8,
                      height: defaultSize * 36.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
