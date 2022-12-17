import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/main.dart';
import 'package:strawberrydaydreams/views/foodlist_view.dart';
import 'package:strawberrydaydreams/views/laundry_view.dart';
import 'package:strawberrydaydreams/views/profile_view.dart';
import '../views/home/home.dart';
import '../views/pglist_view.dart';
import 'navbar.dart';

class NavigationComponent extends StatefulWidget {
  const NavigationComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          Home(),
          PgPage(),
          FoodPage(),
          LaundryPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
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
              press: () {
                setState(() {
                  index = 0;
                });
              },
              isActive: true,
              src: "assets/images/home.png",
            ),
            BottomNavItem(
              title: "PG",
              press: () {
                setState(() {
                  index = 1;
                });
              },
              src: "assets/images/pg.png",
            ),
            BottomNavItem(
              title: "Food",
              press: () {
                setState(() {
                  index = 2;
                });
              },
              src: "assets/images/cookie.png",
            ),
            BottomNavItem(
              title: "Laundry",
              press: () {
                setState(() {
                  index = 3;
                });
              },
              src: "assets/images/shirt.png",
            ),
            BottomNavItem(
              title: "Profile",
              press: () {
                setState(() {
                  index = 4;
                });
              },
              src: "assets/images/user.png",
            ),
          ],
        ),
      ),
    );
  }
}
