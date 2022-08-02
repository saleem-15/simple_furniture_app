// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/services/fetch_categories.dart';
import '/services/fetch_products.dart';
import '../../size_config.dart';
import 'widgets/categories.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/recommeded_products.dart';
import 'widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: MyAppBar(defaultSize: defaultSize),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(
                text: 'Browse by Categories',
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset(
                      'assets/loading-animation.json',
                      width: 200,
                      height: 200,
                    ),
                  );
                }
                return Categories(categories: snapshot.data);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(
                text: 'Recommended For You',
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset(
                      'assets/loading-animation.json',
                      width: 200,
                      height: 200,
                    ),
                  );
                }
                return RecommendedProducts(products: snapshot.data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
