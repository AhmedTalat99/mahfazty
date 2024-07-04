import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahfazty/features/home/home_screen.dart';
import 'package:mahfazty/features/login/ui/screens/login_screen.dart';

class HomeOrLogin extends StatelessWidget {
  const HomeOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            // ther is not data of user
            return LoginScreen();
          } else {
            return HomeScreen();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
