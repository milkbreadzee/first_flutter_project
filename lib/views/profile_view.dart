import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strawberrydaydreams/components/bottomnavbar.dart';

import '../constants/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      bottomNavigationBar: BottomNavBarComponent(),
      body: Column(
        children: <Widget>[
          //pfp, username, chat and mail
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 90,
                  bottom: 15,
                ),
                child: SizedBox(
                  height: 115,
                  width: 115,
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
              const Text(
                "ria",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "+91 85904 98682",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "ria@gmail.com",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 120,
                    ),
                    child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      right: 110,
                    ),
                    child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      iconSize: 32,
                    ),
                  )
                ],
              ),
            ],
          ),
          //row status
          Row(
            children: [],
          ),
          //seetings, account, logout.
          Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Container(
                      height: 188,
                      width: 374,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 50,
                          bottom: 5,
                          right: 50,
                        ),
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                )),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Settings",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                    //   const SizedBox(
                    // height:10 ,),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 50,
                      bottom: 5,
                      right: 50,
                    ),
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Account",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 50,
                      bottom: 5,
                      right: 50,
                    ),
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                        onPressed: ()async {
                            await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(loginRoute,
                          (_) => false); 
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),



                    ],
                  ),

                  
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
