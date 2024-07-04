import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/core/theming/my_colors.dart';
import 'package:mahfazty/core/widgets/my_button.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';
import 'package:mahfazty/features/login/ui/widgets/build_bloc_listener.dart';
import 'package:mahfazty/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:mahfazty/features/login/ui/widgets/email_and_password.dart';
import 'package:mahfazty/features/login/ui/widgets/terms.dart';

import '../../../../core/widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VerticalSpace(150),
                EmailAndPassword(),
              VerticalSpace(20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: FontHelper.font18BoldWhite,
                ),
              ),
              VerticalSpace(50),
              MyButton(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 1],
                  colors: [
                    MyColors.orangeColor,
                    MyColors.yellowColor,
                  ],
                ),
                child: Text(
                  'Login',
                  style: FontHelper.font18BoldWhite,
                ),
                onPressed: () {
                  validateThenLogin(context);
                },
              ),
              VerticalSpace(20),
              const Terms(),
              VerticalSpace(20),
              DontHaveAnAccount(),
              BuildBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}