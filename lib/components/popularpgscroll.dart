import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/popularpgcard.dart';

class PopularPGScroll extends StatelessWidget {
  const PopularPGScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          PopularPgCard(
          hostel: "4 points",
          place: "Near MEC",
          press: () {},
        ),
          PopularPgCard(
          hostel: "YMCA",
          place: "Near MEC",
          press: () {},
        ),
          PopularPgCard(
          hostel: "4 points",
          place: "Near MEC",
          press: () {},
        ),
          PopularPgCard(
          hostel: "4 points",
          place: "Near MEC",
          press: () {},
        ),
        ],
        
      ),
    );
  }
}