import 'package:flutter/material.dart';


import '../components/bottomnavbar.dart';
import '../components/laundrycardscroll.dart';

class LaundryPage extends StatelessWidget {
  //final VoidCallback press;
  const LaundryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
          child: Column(
            
            children:  <Widget>[
             const Padding(
                padding: EdgeInsets.only(
                  top:35,
                  bottom: 10,
                  left: 25,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Best Laundry",
                    
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
        
              //  const SizedBox(height: 10,),
        
               const Padding(
                padding: EdgeInsets.only(
                  
                  bottom: 10,
                  left: 25,
                ),
                 child: Align(
                  alignment: Alignment.centerLeft,
                   child:  Text(
                      "Area",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                 ),
               ),
        
              //add buttons
        
              Row(
                children: <Widget>[
                  const SizedBox(width: 12,),
                  ElevatedButton(
                    child: Text("MEC"),
                    onPressed: (() {
                      
                    }),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      elevation: 2,
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(), 
                    ),
                    
                  ),
                  const SizedBox(width: 20,),
                   ElevatedButton(
                child: Text("TKM"),
                onPressed: (() {
                  
                }),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(), 
                ),
                
              ),
              const SizedBox(width: 20,),
              ElevatedButton(
                child: Text("CET"),
                onPressed: (() {
                  
                }),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(), 
                ),
                
              ),
                ],
              ),
             
             const SizedBox(
              height: 12,
             ),
             LaundryCardScroll(),
            ],
          ),
        );
      
  }
}
