import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final bool isActive;

  const BottomNavItem({
    Key? key,
    
    required this.title,
    required this.press,
    this.isActive = false,
   //  required this.svgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          //Image.asset(svgSrc),
           Text(
            title,
            style: TextStyle(color: isActive? Colors.blue : Colors.black),
            
          ),
        ],
      ),
    );
  }
}
