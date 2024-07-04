import 'package:flutter/material.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/theming/my_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TopExpenses extends StatelessWidget {
  const TopExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularPercentIndicator(
          radius: 50,
          arcType: ArcType.FULL,
          lineWidth: 12,
          percent: 0.7,
          backgroundColor: Colors.transparent,
          center: Text(
            '70%',
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            'Bills',
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: MyColors.purpleColor,
        ),
        CircularPercentIndicator(
          radius: 50,
          arcType: ArcType.FULL,
          lineWidth: 12,
          percent: 0.9,
          backgroundColor: Colors.transparent,
          center: Text(
            '90%',
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            'Internet',
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: Colors.blue,
        ),
        CircularPercentIndicator(
          radius: 50,
          arcType: ArcType.FULL,
          lineWidth: 12,
          percent: .25,
          backgroundColor: Colors.transparent,
          center: Text(
            '25%',
            style: FontHelper.font18BoldWhite,
          ),
          footer: Text(
            'Other',
            style: FontHelper.font18BoldWhite,
          ),
          progressColor: MyColors.orangeColor,
        ),
      ],
    );
  }
}
