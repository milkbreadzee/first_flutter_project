import 'package:flutter/material.dart';

class PopularPgCard extends StatelessWidget {
  const PopularPgCard({
    Key? key,
    required this.hostel,
    required this.place,
    required this.press,
  }) : super(key: key);

  final String hostel, place;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 5,
      ),
      width: size.width * 0.40,
      child: Column(
        children: <Widget>[
          Container(
            height: 126,
            width: 126,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/Hostel2.png"),
              ),
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              width: 126,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 12,
                  bottom: 5,
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "$hostel\n".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "$place",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
