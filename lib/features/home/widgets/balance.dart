import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/my_colors.dart';

import '../../../core/theming/fonts.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.blackColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Your Balance', style: FontHelper.font18BoldWhite),
                  VerticalSpace(5),
                  Text('1000 EGP', style: FontHelper.font28SemiBoldWhite),
                ],
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.cyan,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: MyColors.whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
