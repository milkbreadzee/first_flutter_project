import 'package:flutter/material.dart';

class FoodCardBig extends StatelessWidget {
  const FoodCardBig({
    Key? key, required this.press, required this.messname,
  }) : super(key: key);

  final String messname;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
       width: size.width*0.95,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: <Widget>[
             Container(
              height: 400,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/burger1.png",
                  ),
                ),
              ),
              // height: 325.0,
            ),
             Container(
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
      
            Transform.translate(
               offset: Offset(25, 250),
              child: Text(
                "$messname",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            
             Transform.translate(
              offset: Offset(30, 300),
              child: const Text(
                "₹300/day",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            Transform.translate(
             offset: Offset(25,335 ),
              child: SizedBox(
                height: 30,
                width: size.width * .30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
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