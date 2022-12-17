import 'package:flutter/material.dart';

class Mytab extends StatelessWidget {
  final String iconPath;
  

  const Mytab({super.key, required this.iconPath,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 50,
      child: Container(
        child: Image.asset(
          iconPath,

          color: Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }
}
