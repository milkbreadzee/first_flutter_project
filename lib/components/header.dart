import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      
      //stack -> bg, search bar, welcome text
      child: Stack(
        
        children: <Widget>[
          Container(
            height: size.height * .30, //height of cont = 30% of total height
            decoration: const BoxDecoration(
              color: Color(0xFFF4F5F9), //0xFFF4F5F9
            ),
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  
                    child: Text(
                      "Good Evening",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                 
                ),

                // add pfp here
              ],
            ),
          ),
          

          //end of bg color

          //adding the welcome text
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //  const  Padding(
          //          padding: EdgeInsets.symmetric(horizontal: 12, ),
          //           child: Text(
          //             "Riya Sunil",
          //             style: TextStyle(
          //               fontSize: 24,
          //               fontWeight: FontWeight.w500,
          //               color: Colors.grey,

          //             ),
          //           ),
          //         ),
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

          Positioned(
            bottom: 10,
            left: 10,
            right: 120,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
             
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(20),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              
            ),
          ), // end of search box
        ],
      ),
    );
  }
}
