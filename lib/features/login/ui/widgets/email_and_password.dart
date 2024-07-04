import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';

import '../../../../core/widgets/my_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
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
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: FontHelper.font28SemiBoldWhite,
          ),
          VerticalSpace(30),
          Text(
            'Email',
            style: FontHelper.font28SemiBoldWhite,
          ),
          VerticalSpace(10),
           MyTextFormField(
            hintText: 'Enter your email',
            isObsecure: false,
            controller: emailController,
            validator: (value) {
              if (!value!.contains('@') || value.isEmpty) {
                return 'Invalid Email';
              }
              return null;
            },
          ),
          VerticalSpace(20),
          Text(
            'Password',
            style: FontHelper.font18BoldWhite,
          ),
          VerticalSpace(10),
          MyTextFormField(
            validator: (value) {
              if (value!.length < 8 || value.isEmpty) {
                return 'Invalid Password';
              }
              return null;
            },
            hintText: 'Enter your password',
            isObsecure: isObsecure,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              icon: isObsecure
                  ? Icon(Icons.visibility)
                  : Icon(
                      Icons.visibility_off,
                    ),
            ),
            controller: passwordController,
          ), 
        ],
      ),
    );
  }

}
