import 'package:flutter/material.dart';

import 'package:strawberrydaydreams/components/navbar.dart';

import 'package:strawberrydaydreams/components/popularFoodScroll.dart';
import 'package:strawberrydaydreams/components/popularFoodtext.dart';
import 'package:strawberrydaydreams/main.dart';
import 'package:strawberrydaydreams/views/foodlist_view.dart';
import 'package:strawberrydaydreams/views/laundry_view.dart';
import 'package:strawberrydaydreams/views/pglist_view.dart';
import 'package:strawberrydaydreams/views/profile_view.dart';

import '../../components/bottomnavbar.dart';
import '../../components/header.dart';
import '../../components/popularpgtext.dart';

import '../../components/popularpgscroll.dart';
import '../util/my_tabs.dart';

class Home extends StatelessWidget {
  // List<Widget> myTabs = [
  //   //donut
  //   Mytab(
  //     iconPath: 'assets/images/home.png',
  //   ),
  //   //burger
  //   Mytab(
  //     iconPath: 'assets/images/pg.png',
  //   ),

  //   //smoothie
  //   Mytab(
  //     iconPath: 'assets/images/cookie.png',
  //   ),
  //   //pancake
  //   Mytab(
  //     iconPath: 'assets/images/shirt.png',
  //   ),

  //   Mytab(
  //     iconPath: 'assets/images/user.png',
  //   ),

    // pizza
    // const Mytab(
    //   iconPath:'lib/icons/pizza.png' ,
    //  ),
  //];
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child:
        
         Column(
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
      
            // Expanded(
            // child: TabBarView(
            //   children: [
            //     // donut page
            //     HomePage(),
      
            //     // burger page
            //     PgPage(),
      
            //     // smoothie page
            //     FoodPage(),
      
            //     // pancake page
            //     LaundryPage(),
      
            //     // pizza page
            //     ProfilePage(),
            //   ],
            // ),
            // ),
          ],
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
