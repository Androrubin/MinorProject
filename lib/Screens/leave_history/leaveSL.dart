import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Leave History',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: LeaveHistoryPage(),
//     );
//   }
// }
//

class LeaveHistoryPage extends StatefulWidget {
  @override
  _MealLeavePage createState() => _MealLeavePage();
}

class _MealLeavePage extends State<LeaveHistoryPage> {
  // Future<void> fetchLeaveData() async {
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('leave_requests')
  //         .where('type', isEqualTo: 'Long')
  //         .get();
  //
  //     querySnapshot.docs.forEach((doc) {
  //       // Extract data from Firestore document
  //       DateTime startDateTime = doc['startDateTime'].toDate();
  //       DateTime endDateTime = doc['endDateTime'].toDate();
  //       String startMeal = doc['startMeal'];
  //       String endMeal = doc['endMeal'];
  //       int total=doc['totalMeals'];
  //
  //       // Format data into desired structure and add to leaveData list
  //       leaveData.add({
  //         'startDate': DateFormat('dd-MM-yyyy').format(startDateTime),
  //         'endDate': DateFormat('dd-MM-yyyy').format(endDateTime),
  //         'startMeal': startMeal,
  //         'endMeal': endMeal,
  //         'total': total.toString()
  //       });
  //     });
  //   } catch (e) {
  //     print('Error fetching leave data: $e');
  //   }
  // }
  // Future<void> fetchMealData() async {
  //   try {
  //     // Access Firestore collection 'leave_requests'
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('leave_requests')
  //         .where('type', isEqualTo: 'Single')
  //         .get();
  //
  //     querySnapshot.docs.forEach((doc) {
  //
  //       // DateTime dateTime = DateTime.parse();
  //
  //       // String formattedDateTime = DateFormat('dd-MM-yyyy HH:mm').format(doc['dateTime'].toDate());
  //       String date = doc['dateTime'].toDate().toString()??'12-10-2023';
  //       List<dynamic> mealsList = doc['mealsList']??'fjalskdj';
  //
  //       mealData.add({
  //         'date': date,
  //         'meals': mealsList.map((meal) => meal.toString()).toList(),
  //       });
  //     });
  //
  //   } catch (e) {
  //     print('Error fetching meal data: $e');
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchMealData();
    // fetchLeaveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Leave History",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,

            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1F283E),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [

              Container(
                margin: EdgeInsets.only(left: 6, top: 10),
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/food_image1.jpg',
                        width: 350,
                        color: Colors.black.withOpacity(0.4),
                        colorBlendMode: BlendMode.multiply,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leave History',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'See all your mess leaves, single and long, in one click!',
                            style: GoogleFonts.outfit(
                                fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () async {},
                              child: Text(
                                'Single or Long Leave',
                                style: GoogleFonts.outfit(
                                    fontSize: 16, color: Colors.white),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                    ],),),],
                ),
              ),
            ]),
                          Container(
                            margin: EdgeInsets.only(top: 20),

                              child: Column(
                                children: <Widget>[

                                   Card(
                                    color: Color(0xFF1F283E),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleMealHistoryPage()),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                        child: Text('Single Meal Leave History',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20, // Distance between cards
                                  ),
                                   Card(
                                    color: Color(0xFF1F283E),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LongTermLeaveHistoryPage()),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                        child: Text('Long Term Leave History',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                          ),

          ],
        ));
  }
}

class SingleMealHistoryPage extends StatefulWidget {
  @override
  _MealDataScreenState createState() => _MealDataScreenState();
}

class _MealDataScreenState extends State<SingleMealHistoryPage> {
  List<Map<String, dynamic>> mealData = [];
  List<Map<String, dynamic>> leaveData=[];

  @override
  void initState() {
    super.initState();
    fetchMealData();
  }

  Future<void> fetchMealData() async {
    try {
      // Access Firestore collection 'leave_requests'
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('leave_requests')
          .where('type', isEqualTo: 'Single')
          .get();

      querySnapshot.docs.forEach((doc) {
        // DateTime dateTime = DateTime.parse();

        // String formattedDateTime = DateFormat('dd-MM-yyyy HH:mm').format(doc['dateTime'].toDate());
        String date = doc['dateTime'].toDate().toString() ?? '12-10-2023';
        List<dynamic> mealsList = doc['mealsList'] ?? 'fjalskdj';

        mealData.add({
          'date': date,
          'meals': mealsList.map((meal) => meal.toString()).toList(),
        });
        setState(() {
          leaveData = mealData; // Update the state with new data
        });
      });
    } catch (e) {
      print('Error fetching meal data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Meal Leave History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1F283E),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              25,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 30),
            itemCount: leaveData.length,
            itemBuilder: (context, index) {
              final meal = leaveData[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Single Leave',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildRowWithIcon(
                            'Date', meal['date'], Icons.date_range_outlined),
                        SizedBox(height: 16),
                        _buildRowWithIcon('Meals', meal['meals'].join(', '),
                            Icons.restaurant_menu_outlined),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithIcon(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8),
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class LongTermLeaveHistoryPage extends StatefulWidget {
  @override
  _LongLeaveHistoryPage createState() => _LongLeaveHistoryPage();

}

class _LongLeaveHistoryPage extends State<LongTermLeaveHistoryPage> {
   List<Map<String, String>> leaveData = [];
   List<Map<String, String>> leaveData2 = [];
  Future<void> fetchLeaveData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('leave_requests')
          .where('type', isEqualTo: 'Long')
          .get();

      querySnapshot.docs.forEach((doc) {
        // Extract data from Firestore document
        DateTime startDateTime = doc['startDateTime'].toDate();
        DateTime endDateTime = doc['endDateTime'].toDate();
        String startMeal = doc['startMeal'];
        String endMeal = doc['endMeal'];
        int total = doc['totalMeals'];

        // Format data into desired structure and add to leaveData list
        leaveData.add({
          'startDate': DateFormat('dd-MM-yyyy').format(startDateTime),
          'endDate': DateFormat('dd-MM-yyyy').format(endDateTime),
          'startMeal': startMeal,
          'endMeal': endMeal,
          'total': total.toString()
        });
        setState(() {
          leaveData2 = leaveData; // Update the state with new data
        });
      });
    } catch (e) {
      print('Error fetching leave data: $e');
    }

  }

  initState() {
    super.initState();

    fetchLeaveData();
  }

  // Sample data for demonstration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Long Term Leave History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1F283E),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              25,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 35),
            itemCount: leaveData.length,
            itemBuilder: (context, index) {
              final leave = leaveData[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Long Leave',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      _buildRowWithIcon('Start Date', leave['startDate']!,
                          Icons.date_range_outlined),
                      // SizedBox(width: 20,),
                      _buildRowWithIcon('Start Meal', leave['startMeal']!,
                          Icons.restaurant_menu_outlined),
                      SizedBox(height: 16),
                      _buildRowWithIcon('End Date', leave['endDate']!,
                          Icons.date_range_outlined),
                      _buildRowWithIcon('End Meal', leave['endMeal']!,
                          Icons.restaurant_menu_outlined),
                      SizedBox(height: 16),
                      _buildRowWithIcon('Total Meals', leave['total'] ?? "0",
                          Icons.bar_chart),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithIcon(String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ],
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}
