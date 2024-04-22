
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

import '../LeaveFragment.dart';


class SurveysScreen extends StatelessWidget {
  String selectedMeals = '';
    List<String>selectedMealList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text('Apply for Leave', style: TextStyle(color: Colors.white),),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 50,),
          Image.asset('assets/takeleave.png', height: 200,),
          SizedBox(height: 50,),
          InkWell(
            onTap: (){

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmation"),
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Select the meals that you will skip:"),
                            CheckboxListTile(
                              title: Text('Breakfast'),
                              value: selectedMeals.contains('Breakfast'),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedMeals += 'Breakfast, ';

                                    selectedMealList.add('Breakfast');
                                  } else {
                                    selectedMeals = selectedMeals.replaceAll('Breakfast, ', '');
                                    selectedMealList.remove('Breakfast');
                                  }
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Lunch'),
                              value: selectedMeals.contains('Lunch'),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedMeals += 'Lunch, ';

                                    selectedMealList.add('Lunch');
                                  } else {
                                    selectedMeals = selectedMeals.replaceAll('Lunch, ', '');
                                    selectedMealList.remove('Lunch');
                                  }
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Dinner'),
                              value: selectedMeals.contains('Dinner'),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedMeals += 'Dinner, ';
                                    selectedMealList.add('Dinner');
                                  } else {
                                    selectedMeals = selectedMeals.replaceAll('Dinner, ', '');
                                    selectedMealList.remove('Dinner');
                                  }
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      ElevatedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          // Show the Snackbar with selected meals
                          String snackBarMessage = 'You will be skipping: $selectedMeals';
                          showSuccessDialog(context, snackBarMessage, selectedMealList);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/single_leave.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Single meal leave',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Note: Single meal leaves need to be reported on the same day',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LeaveApplicationPage()));
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Long Leave',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Select start and final date for leave',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/long_leave.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showSuccessDialog(BuildContext context, String snackBarMessage, List<String> meals) {
    // Get the current date and time
    DateTime now = DateTime.now();
    FirebaseAuth _auth=FirebaseAuth.instance;

    // Get the user's email/name (replace this with your actual method to get the user's name)
    String? userName = _auth.currentUser?.displayName.toString(); // Replace with actual user's email/name

    FirebaseFirestore.instance.collection('leave_requests').add({
      'userName': userName,
      'dateTime': now,
      'mealsList': meals,
      'type': 'Single'
    })
        .then((value) {
      void showSuccessDialog(BuildContext parentContext, String snackBarMessage, List<String> meals) {
        // Get the current date and time
        DateTime now = DateTime.now();
        FirebaseAuth _auth=FirebaseAuth.instance;

        // Add a delay before showing the dialog
        Future.delayed(Duration(seconds: 2), () {
          showDialog(
            context: parentContext, // Use the parent context
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(snackBarMessage),
                    SizedBox(height: 10),
                    Text('Selected meals: ${meals.join(', ')}'), // Display selected meals
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
        });
      }

    })
        .catchError((error) {
      // Handle errors while saving to Firestore
      print("Failed to save data: $error");
      // Show error dialog or snackbar
    });
  }
  }


  class LeavePage extends StatelessWidget {
  void _showSickLeaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sick Leave"),
          content: Text("Please describe your situation."),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showScheduledLeaveCalendar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 400,
            child: CalendarCarousel(),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text('Leave Page', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () => _showSickLeaveDialog(context),
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset('assets/sick_leave.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () => _showScheduledLeaveCalendar(context),
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset('assets/scheduled_leave.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}