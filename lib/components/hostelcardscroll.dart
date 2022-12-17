import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/hostelscard.dart';



class HostelCardScroll extends StatelessWidget {
  const HostelCardScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          HostelCardBig(
            hostelname: "4 points",
            press: () {},
          ),

          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "YMCA",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "vimala",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "4 points",
            press: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "4 points",
            press: () {},
          ),
        ],
      ),
    );
  }
}
