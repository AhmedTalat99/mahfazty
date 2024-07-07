import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import 'balance.dart';
import 'latest_expenses.dart';
import 'my_appbar.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/fonts.dart';
import '../../../core/theming/my_colors.dart';
import 'top_expenses.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(10),
              MyAppBar(),
              Balance(),
              VerticalSpace(10),
              Text('Top Transactions', style: FontHelper.font18BoldWhite),
              VerticalSpace(20),
              TopExpenses(),
              VerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transactions', style: FontHelper.font18BoldWhite),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTransactionScreen()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              VerticalSpace(20),
              LatestExpenses(),
            ],
          ),
        ),
      ),
    );
  }
}
