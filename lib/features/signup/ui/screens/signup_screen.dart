import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/features/login/ui/widgets/terms.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';
import 'package:mahfazty/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:mahfazty/features/signup/ui/widgets/signup_form.dart';

import '../../../../core/theming/my_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: MyColors.blackColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace(20),
                SignupForm(),
                VerticalSpace(30),
                Terms(),
                VerticalSpace(30),
                MyButton(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0,
                        1
                      ],
                      colors: [
                        MyColors.orangeColor,
                        MyColors.yellowColor,
                      ]),
                  child: Text(
                    'Sign Up',
                    style: FontHelper.font18BoldWhite,
                  ),
                  onPressed: () {
                    validateSignup(context);
                  },
                ),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate())
      context.read<SignupCubit>().Signup();
  }
}
