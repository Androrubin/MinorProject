import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class LeaveApplicationPage extends StatefulWidget {
  @override
  _LeaveApplicationPageState createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  bool? isSingleDayLeave = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String userName = '';
  String? startMeal='Breakfast';
  String? endMeal='Dinner';

  // List of available meal options
  List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];
  void _applyLeave() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Leave Application'),
          content: Text('Are you sure you want to take leave?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {


                // Close the confirmation dialog
                Navigator.of(context).pop();
                saveDataAndShowDialog();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Leave applied successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
  int calculateTotalMeals() {
    int totalMeals = 0;

    // Calculate total meals if startDate and endDate are not null
    if (startDate != null && endDate != null) {
      // Calculate the difference in days between startDate and endDate
      int daysDifference = endDate.difference(startDate).inDays;

      // Adding one meal for the start day
      if (startMeal == 'Breakfast' || startMeal == 'Lunch' || startMeal == 'Dinner') {
        totalMeals++;
      }

      // Adding meals for the days in between
      totalMeals += (daysDifference * 3); // Assuming each day has 3 meals

      // Adding one meal for the end day
      if (endMeal == 'Breakfast' || endMeal == 'Lunch' || endMeal == 'Dinner') {
        totalMeals++;
      }
    }

    return totalMeals;
  }
  void saveDataAndShowDialog() {
    // Convert DateTime objects to Timestamps
    Timestamp startTimestamp = Timestamp.fromDate(startDate);
    Timestamp endTimestamp = Timestamp.fromDate(endDate);

    // Save to Firestore
    FirebaseAuth _auth=FirebaseAuth.instance;
    String? username=_auth.currentUser?.displayName;
    FirebaseFirestore.instance.collection('leave_requests').add({
      'userName': username,
      'startDateTime': startTimestamp, // Use startDateTime instead of dateTime
      'endDateTime': endTimestamp, // Use endDateTime instead of dateTime
      'startMeal': startMeal,
      'endMeal': endMeal,
      'totalMeals': calculateTotalMeals(), // Calculate total meals
      'type': 'Long'
    }).then((value) {
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Row(
              children: <Widget>[
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Text('Successfully applied from date\n'+startDate.toString()+' to\n '+endDate.toString()+'\nHappy holidays!'),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      // Handle errors if any
      print('Error saving data: $error');
      print('Error saving data: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: Image.asset('assets/food_leave_image.jpg').image,
              height: 240,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 6.0, top: 4.0),
              child: Container(
                height: 500.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 40, 62),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  // Use SingleChildScrollView to handle overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Leave Type:',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),

                      if (isSingleDayLeave == false) // Check for null or false
                        Column(
                          children: [
                            SizedBox(height: 20.0),
                            DatePickerField(
                              label: 'Start Date',
                              selectedDate: startDate,
                              onDateSelected: (date) {
                                setState(() {
                                  startDate = date;
                                });
                              },
                            ),
                            DropdownButtonFormField<String>(
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Color.fromARGB(255, 31, 40, 62),

                              padding: EdgeInsets.only(top: 20.0),
                              value: startMeal,
                              onChanged: (newValue) {
                                setState(() {
                                  startMeal = newValue;
                                });
                              },
                              items: meals.map<DropdownMenuItem<String>>((String meal) {
                                return DropdownMenuItem<String>(
                                  value: meal,
                                  child: Text(meal),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                labelText: 'Start Meal',
        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
                              ),
                            ),

                            // DatePickerField for End Date
                            DatePickerField(

                              label: 'End Date',
                              selectedDate: endDate,
                              onDateSelected: (date) {
                                setState(() {
                                  endDate = date;
                                });
                              },
                            ),

                            // Dropdown for selecting End Meal
                            DropdownButtonFormField<String>(

                              style: TextStyle(color: Colors.white),
                              dropdownColor: Color.fromARGB(255, 31, 40, 62),
                              padding: EdgeInsets.only(top: 20.0),
                              value: endMeal,
                              onChanged: (newValue) {
                                setState(() {
                                  endMeal = newValue;
                                });
                              },
                              items: meals.map<DropdownMenuItem<String>>((String meal) {
                                return DropdownMenuItem<String>(
                                  value: meal,
                                  child: Text(meal),
                                );
                              }).toList(),
                              decoration: InputDecoration(

                                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
                                labelText: 'End Meal',
                              ),
                            ),


                          ],
                        ),
                      SizedBox(height: 20.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _applyLeave,
                          child: Text('Apply'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  DatePickerField({
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:
              Text(label, style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        SizedBox(height: 10.0),
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              border: OutlineInputBorder(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaveApplicationPage(),
    );
  }
}
