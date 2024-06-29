import 'package:flutter/material.dart';

import '../theming/fonts.dart';
import '../theming/my_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.validator,
    this.suffixIcon,
    required this.hintText,
    required this.isObsecure,
    required this.controller,
  });
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      validator: validator,
      style: FontHelper.font18GreyW300,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: FontHelper.font18GreyW300,
        filled: true,
        fillColor: MyColors.greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
