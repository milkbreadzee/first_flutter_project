import 'package:flutter/material.dart';

import 'popularFoodCard.dart';

class PopularFoodScroll extends StatelessWidget {
  const PopularFoodScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          PopularFoodCard(
            messname: "Vindy Mess",
            press: () {},
          ),

          const SizedBox(
            height: 20,
          ),
          PopularFoodCard(
            messname: "MEC Mess",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          PopularFoodCard(
            messname: "MEC Mess",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          PopularFoodCard(
            messname: "MEC Mess",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          PopularFoodCard(
            messname: "MEC Mess",
            press: () {},
          ),
        ],
      ),
    );
  }
}
