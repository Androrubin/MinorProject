import 'package:flutter/material.dart';

class LeaveHistory extends StatefulWidget {
  const LeaveHistory({super.key});

  @override
  State<LeaveHistory> createState() => _LeaveHistoryState();
}

class _LeaveHistoryState extends State<LeaveHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Leave History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 183, 206, 224),
          margin: EdgeInsets.all(10),
          height: 450,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                ]),
                margin: EdgeInsets.only(top: 45, left: 10, right: 10),
                height: 120,
                child: Card(
                  color: const Color.fromARGB(228, 255, 255, 255),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadowColor: Colors.black45,
                  child: const Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Start date: ",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "DATA",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "End date: ",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "DATA",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                ]),
                margin: EdgeInsets.only(top: 45, left: 10, right: 10),
                height: 180,
                child: Card(
                  color: const Color.fromARGB(228, 255, 255, 255),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Date: ",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "DATA",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Selected Meal:   \n",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "BREAKFAST",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Text(
                                        "LUNCH",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
