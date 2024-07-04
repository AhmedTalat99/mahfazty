import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
     this.width= double.infinity,
    this.hight = 50,
    this.onPressed,
    required this.gradient,
    required this.child,
  });
  final double width;
  final double hight;
  final void Function()? onPressed;
  final Gradient gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(child: child),
        ),
      ),
    );
  }
}
