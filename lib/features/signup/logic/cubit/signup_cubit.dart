import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/features/signup/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.firebaseHelper) : super(SignupInitial());
  final FirebaseHelper firebaseHelper;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Signup() async {
    emit(SignupLoadingState());
    try {
      firebaseHelper
          .registerUser(
            emailController.text.trim(),
            passwordController.text.trim(),
          )
          .then((value) => SignupSuccessState());
    } catch (e) {
      emit(SignupErrorState());
    }
  }
}
