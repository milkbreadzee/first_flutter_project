import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class IndvPGView extends StatelessWidget {
  const IndvPGView({super.key, required this.hostelname});

  final String? hostelname;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * .40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/Hostel2.png")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Hostel",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 26),
                  child: Text(
                    "$hostelname",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 26),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.place_outlined, size: 16),
                        ),
                        TextSpan(
                          text: " Pipeline junction",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10, left: 12, bottom: 20, right: 20),
                    child: Flexible(
                      child: ExpandableText(
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 3,
                        linkColor: Colors.blue,
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 55,
                      width: size.width * .45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Select Room",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 55,
                      width: size.width * .45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
