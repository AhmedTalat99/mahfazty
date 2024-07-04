import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../logic/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  bool isObsecure = true;

  @override
  void initState() {
    super.initState();
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    passwordConfirmationController =
        context.read<SignupCubit>().passwordConfirmationController;
    nameController = context.read<SignupCubit>().nameController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome To Mahfazty!',
            style: FontHelper.font18BoldWhite.copyWith(
              fontSize: 25,
            ),
          ),
          VerticalSpace(30),
          Text('Name', style: FontHelper.font18BoldWhite),
          VerticalSpace(10),
          MyTextFormField(
            hintText: 'Enter Your Name',
            isObsecure: false,
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter name!';
              }
              return null;
            },
          ),
          VerticalSpace(30),
          Text('Email', style: FontHelper.font18BoldWhite),
          VerticalSpace(10),
          MyTextFormField(
            hintText: 'Enter Your Email',
            isObsecure: false,
            controller: emailController,
            validator: (value) {
              if (value == null || !value.contains('@') || value.isEmpty) {
                return 'Invalid Email';
              }
              return null;
            },
          ),
          VerticalSpace(30),
          Text('Password', style: FontHelper.font18BoldWhite),
          VerticalSpace(10),
          MyTextFormField(
            hintText: 'Enter Your Password',
            isObsecure: isObsecure,
            controller: passwordController,
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
            validator: (value) {
              if (value == null || value.length < 8 || value.isEmpty) {
                return 'Invalid Password';
              }
              return null;
            },
          ),
          VerticalSpace(30),
          Text('Password Confirmation', style: FontHelper.font18BoldWhite),
          VerticalSpace(10),
          MyTextFormField(
            hintText: 'Re-enter Your Password',
            isObsecure: isObsecure,
            controller: passwordConfirmationController,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please re-enter your password';
              } else if (passwordConfirmationController.text.trim() !=
                  passwordController.text.trim()) {
                return "Passwords Doesn't match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
