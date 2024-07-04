import 'package:flutter/material.dart';

import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: MyColors.whiteColor,
            size: 30,
          ),
        ),
        Text('My Wallet', style: FontHelper.font18BoldWhite),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: MyColors.whiteColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
