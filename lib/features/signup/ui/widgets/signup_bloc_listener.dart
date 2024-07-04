import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoadingState ||
          current is SignupSuccessState ||
          current is SignupErrorState,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if (state is SignupErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Error Signning Up"),
            backgroundColor: Colors.red,
          ));
        } else {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
