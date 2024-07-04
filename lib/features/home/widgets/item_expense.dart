import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/theming/my_colors.dart';

class ItemExpense extends StatelessWidget {
  const ItemExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 41, 39, 78),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Electricity',
                      style: FontHelper.font18BoldWhite,
                    ),
                    Text(
                      'Jul 2, 2024',
                      style: FontHelper.font13GreyW300,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '-60LE',
                    style: FontHelper.font18BoldWhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: double.infinity,
              width: 20,
              decoration: BoxDecoration(
                color: MyColors.orangeColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
