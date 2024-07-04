import 'package:flutter/material.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/core/theming/my_colors.dart';

import '../../../../core/theming/fonts.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account?',
          style: FontHelper.font13WhiteW300,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signup);
          },
          child: Text(
            'Sign Up',
            style: FontHelper.font13WhiteW300.copyWith(
              color: MyColors.yellowColor,
            ),
          ),
        ),
      ],
    );
  }
}
