import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/main.dart';
import 'package:strawberrydaydreams/views/food_view.dart';
import 'package:strawberrydaydreams/views/laundry_view.dart';
import 'package:strawberrydaydreams/views/profile_view.dart';
import '../views/pg_view.dart';
import 'navbar.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
        
      //   borderRadius: BorderRadius.circular(12),
      // ), 
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      height: 55,
      width: 120,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Home",

            press: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );},
            isActive: true,
            src: "assets/images/home.png",
          ),
          BottomNavItem(
            title: "PG",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return PgPage();
                }),
              );
            },
            src: "assets/images/pg.png",
          ),
          BottomNavItem(
            title: "Food",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return FoodPage();
                }),
              );
            },
             src: "assets/images/cookie.png",
          ),
           BottomNavItem(
            title: "Laundry",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return LaundryPage();
                }),
              );
            },
             src: "assets/images/shirt.png",
          ),
           BottomNavItem(
            title: "Profile",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return ProfilePage();
                }),
              );
            },
             src: "assets/images/user.png",
          ),
        ],
      ),
    );
  }
}