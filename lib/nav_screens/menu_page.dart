import 'package:flutter/material.dart';
import '../models/menu_items.dart';

Color themecolor = Color(0xFF1F283E);
Color searchBarcolor = Color(0xFF9EA2AD);
Color cardColor = Color.fromRGBO(0x74, 0x74, 0x74, 0.08);
Color textColor = Color(0xFF36454F);





class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    height: 180,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: themecolor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Mess Menu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),





                  //end
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 40, right:40),
                    child:  Container(
                                height: 150,
                                child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(menuItems.length, (index) {
                                  MenuItem menuItem = menuItems[index];
                                return Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 10,
                                child: Container(
                                width: 290, // Set the width as per your needs
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.orange,
                                      Colors.orange.shade300,
                                      Colors.orange.shade200,
                                      Colors.orange.shade100,
                                      ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                borderRadius: BorderRadius.circular(16),
                                ),

                                 child: Row(
                                   children: [
                                      Padding(
                                       padding: EdgeInsets.all(10.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                            Text(
                                             menuItem.title,
                                             style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 16,
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),

                                             Text(
                                               menuItem.description,
                                               style: TextStyle(
                                                 color: Colors.white,
                                                 fontSize: 16,
                                               ),
                                             ),

                                         ],
                                       ),
                                     ),
                                     Image.asset(
                                       "assets/images/lunch.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                   ],
                                 ),
                                ),
                                ),
                                );
                                }),
                                ),

                                ),
                  ),
                  // Positioned(
                  //   top: 160,
                  //   right: 20,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: Image.asset(
                  //       "assets/icons/move_ahead.png",
                  //       width: 30,
                  //       height: 30,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 160,
                  //   left: 20,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: Image.asset(
                  //       "assets/icons/move_back.png",
                  //       width: 30,
                  //       height: 30,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation:  10,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green,
                          Colors.green.shade300,
                          Colors.green.shade200,
                          Colors.green.shade100,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),

                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        "Click here to get the entire week menu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 10,
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 10,
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














// Container(
// height: 150,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: List.generate(4, (index) {
// return Padding(
// padding: const EdgeInsets.only(left: 10, right: 10),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(16),
// ),
// elevation: 10,
// child: Container(
// width: 250, // Set the width as per your needs
// decoration: BoxDecoration(
// color: cardColor,
// borderRadius: BorderRadius.circular(16),
// ),
// ),
// ),
// );
// }),
// ),
// ),


