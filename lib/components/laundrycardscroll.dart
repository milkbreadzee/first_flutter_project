import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/laundryscard.dart';


class LaundryCardScroll extends StatelessWidget {
  const LaundryCardScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          LaundryCardBig(
            laundryname: "laundry1",
            press: () {},
          ),

          const SizedBox(
            height: 20,
          ),
          LaundryCardBig(
            laundryname: "laundry2",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          LaundryCardBig(
            laundryname: "laundry3",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          LaundryCardBig(
            laundryname: "laundry4",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          LaundryCardBig(
            laundryname: "laundry5",
            press: () {},
          ),
        ],
      ),
    );
  }
}
