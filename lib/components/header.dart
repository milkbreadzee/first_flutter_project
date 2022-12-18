import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:strawberrydaydreams/components/popularpgtext.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520277739336-7bf67edfa768?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80',
  'https://images.unsplash.com/photo-1532344214108-1b6d425db572?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80',
  'https://images.unsplash.com/photo-1455587734955-081b22074882?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1551218372-a8789b81b253?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final themeMode = ValueNotifier(2);

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * .12,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    right: 25,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/pfp1.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: size.width,
            height: size.height*.30,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
            

          ),



          //add buttons
          

          const SizedBox(
            height: 12,
          ),

          // PopularPGtext(),

        ],
      ),
    );

    // return Container(

    //   //stack -> bg, search bar, welcome text
    //   child: Stack(

    //     children: <Widget>[
    //       Container(
    //         height: size.height * .45, //height of cont = 30% of total height
    //         decoration: const BoxDecoration(
    //           color: Color(0xFFF4F5F9), //0xFFF4F5F9
    //         ),
    //         child: Row(
    //           children: const <Widget>[
    // Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 12),

    //     child: Text(
    //       "Good Evening",
    //       style: TextStyle(
    //         fontSize: 32,
    //         fontWeight: FontWeight.w600,
    //         color: Colors.black,
    //       ),
    //     ),

    // ),

    // add pfp here
    //     ],
    //   ),
    // ),

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

    // Positioned(
    //   bottom: 10,
    //   left: 10,
    //   right: 120,
    //   child: Container(
    //     height: 54,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(12),
    //     ),

    //       child: const TextField(
    //         decoration: InputDecoration(
    //           hintText: "Search",
    //           prefixIcon: Icon(Icons.search_outlined),
    //           contentPadding: EdgeInsets.only(
    //             bottom: 20,
    //             top:20,
    //           ),
    //           hintStyle: TextStyle(
    //             color: Colors.grey,
    //           ),
    //           enabledBorder: InputBorder.none,
    //           focusedBorder: InputBorder.none,
    //         ),
    //       ),

    //   ),
    // ), // end of search box
    //     ],
    //   ),
    // );
  }
}
