import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/main.dart';
import 'package:strawberrydaydreams/views/food_view.dart';
import 'package:strawberrydaydreams/views/laundry_view.dart';
import '../views/pg_view.dart';
import 'navbar.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      height: 55,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Home",
            press: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );},
            isActive: true,
          ),
          BottomNavItem(
            title: "PG",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return PgPage();
                }),
              );
            },
          ),
          BottomNavItem(
            title: "Food",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FoodPage();
                }),
              );
            },
          ),
           BottomNavItem(
            title: "Laundry",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LaundryPage();
                }),
              );
            },
          ),
           BottomNavItem(
            title: "Profile",
            press: () {},
          ),
        ],
      ),
    );
  }
}