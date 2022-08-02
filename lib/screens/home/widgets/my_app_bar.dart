import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.defaultSize,
  });

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          height: defaultSize * 2, //20
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/scan.svg',
            height: defaultSize * 2.4, //24
          ),
        ),
        const Center(
          child: Text(
            'Scan',
            style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: defaultSize,
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
