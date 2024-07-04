import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/features/home/widgets/item_expense.dart';

class LatestExpenses extends StatelessWidget {
  const LatestExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView(
        children: [
          ItemExpense(),
          VerticalSpace(20),
          ItemExpense(),
          VerticalSpace(20),
          ItemExpense(),
        ],
      ),
    );
  }
}
