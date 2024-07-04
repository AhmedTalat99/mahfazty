import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahfazty/core/routing/routing.dart';
import 'package:mahfazty/home_or_login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routing});
  final Routing routing;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mahfazty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeOrLogin(),
        onGenerateRoute: Routing.generateRoute,
      ),
    );
  }
}
