import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double diameter;
  final Color backgroundColor;

  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.diameter = 40,
    this.backgroundColor = AppColors.lightGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          padding: EdgeInsets.zero, // remove default padding
        ),
      ),
    );
  }
}