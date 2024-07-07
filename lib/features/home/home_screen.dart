import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/features/home/widgets/balance.dart';
import 'package:mahfazty/features/home/widgets/top_expenses.dart';
import 'package:mahfazty/features/transactions/transactions_screen.dart';

import '../../core/theming/my_colors.dart';
import 'widgets/home_body.dart';
import 'widgets/latest_expenses.dart';
import 'widgets/my_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  List<Widget> screens = [HomeBody(), TransactionsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, .5],
              colors: [
                MyColors.redColor,
                MyColors.navyColor,
              ],
            ),
          ),
          child: screens[currentIndex]),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color: MyColors.yellowColor),
            unselectedIconTheme: IconThemeData(color: MyColors.whiteColor),
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false, // hidding label
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.analytics_outlined,
                    size: 30,
                  ),
                  label: 'Transactions'),
            ],
          ),
        ),
      ),
    );
  }
}
