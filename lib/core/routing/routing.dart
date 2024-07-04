import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';
import 'package:mahfazty/features/login/ui/screens/login_screen.dart';
import 'package:mahfazty/features/signup/ui/screens/signup_screen.dart';

import '../../features/home/home_screen.dart';

class Routing {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      default:
        return MaterialPageRoute(builder: (context) => NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No Route Found"),
      ),
    );
  }
}
