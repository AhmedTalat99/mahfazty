import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/routing/routing.dart';
import 'package:mahfazty/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/login/logic/cubit/login_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => LoginCubit(FirebaseHelper()),
    ),
  ], child: MyApp(routing: Routing())));
}
