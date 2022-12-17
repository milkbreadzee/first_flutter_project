import 'package:flutter/material.dart';

import 'package:strawberrydaydreams/components/navbar.dart';

import 'package:strawberrydaydreams/components/popularFoodScroll.dart';
import 'package:strawberrydaydreams/components/popularFoodtext.dart';
import 'package:strawberrydaydreams/views/pg_view.dart';

import '../../components/bottomnavbar.dart';
import '../../components/header.dart';
import '../../components/popularpgtext.dart';

import '../../components/popularpgscroll.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBarComponent(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(size: size),

            //first container  --> header container

            const SizedBox(
              height: 20,
            ),

            PopularPGtext(),

            const SizedBox(
              height: 20,
            ),

            PopularPGScroll(),

            const SizedBox(
              height: 20,
            ),

            PopularFoodtext(),

            const SizedBox(
              height: 20,
            ),

            PopularFoodScroll(),
          ],
        ),
      ),
    );
  }
}










//  SizedBox(
//   height: 177,
//   child: ListView(
//     reverse: true,
//     scrollDirection: Axis.horizontal,
//     children: const <Widget>[
//       SizedBox(
//         width: 126,
//         height: 176,
//         child:  Text("pg 1"),
//       ),
//       SizedBox(
//         width: 126,
//         height: 176,
//         child: Text("pg 1"),
//       ),
//       SizedBox(
//         width: 126,
//         height: 176,
//         child:  Text("pg 1"),
//       ),
//     ],

//   ),
// ),
