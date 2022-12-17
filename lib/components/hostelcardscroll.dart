import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/hostelscard.dart';
import 'package:strawberrydaydreams/views/pg_view.dart';

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
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IndvPGView(hostelname: "4 Points", )),
              );
            },
            imgSrc: "assets/images/Hostel2.png",
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "YMCA",
            press: () {},
            imgSrc: "assets/images/Hostel2.png",
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "vimala",
            press: () {},
            imgSrc: "assets/images/Hostel2.png",
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "4 points",
            press: () {},
            imgSrc: "assets/images/Hostel2.png",
          ),
          const SizedBox(
            height: 20,
          ),
          HostelCardBig(
            hostelname: "4 points",
            press: () {},
            imgSrc: "assets/images/Hostel2.png",
          ),
        ],
      ),
    );
  }
}
