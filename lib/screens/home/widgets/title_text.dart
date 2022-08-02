
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
        final defaultSize = SizeConfig.defaultSize;

    return Text(
      text,
      style: TextStyle(
        fontSize: defaultSize * 1.6,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}