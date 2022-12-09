import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final EdgeInsets margin, padding;
  final Color backgroundColor;
  final Widget child;

  const CustomBackground({
    Key? key,
    this.margin = const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    this.padding = const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
    this.backgroundColor = background,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(21)),
        boxShadow: [
          BoxShadow(
            color: secondary.withOpacity(0.50),
            blurRadius: 5,
            spreadRadius: 3,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
