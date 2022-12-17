import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/foodscard.dart';

class FoodCardScroll extends StatelessWidget {
  const FoodCardScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          FoodCardBig(
            messname: "MEC Mess",
            press: () {},
          ),

          const SizedBox(
            height: 20,
          ),
          FoodCardBig(
            messname: "Vindys Mess",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          FoodCardBig(
            messname: "Farhah",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          FoodCardBig(
            messname: "MEC Mess",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          FoodCardBig(
            messname: "MEC Mess",
            press: () {},
          ),
        ],
      ),
    );
  }
}
