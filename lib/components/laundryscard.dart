import 'package:flutter/material.dart';

class LaundryCardBig extends StatelessWidget {
  const LaundryCardBig({
    Key? key, required this.press, required this.laundryname,
  }) : super(key: key);

  final String laundryname;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 176,
      width: 344,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Material(
                child: Container(
                  // width: size * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.3),
                    //     offset: Offset(0, 6),
                    //     blurRadius: 15,
                    //     spreadRadius: 2,
                    //   ),
                    // ],
                  ),
                ),
              ),
            ),
      
            Positioned(
              top: 0,
              left: 4,
              child: Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 161,
                  width: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/laundry.png"),
                    ),
                  ),
                ),
              ),
            ),
      
            Positioned(
              top: 10,
              left: 165,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$laundryname",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "10 per item",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Near MEC\nNear MEC Lorem Ipsum is\n simply dummy text of the printing\nand typesetting industry.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      
            //new widget here
          ],
        ),
      ),
    );
  }
}