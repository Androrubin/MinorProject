
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeavePage extends StatefulWidget {
  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  String selectedLeaveType = 'Single Leave';

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String selectedStartMeal = 'Breakfast';
  String selectedEndMeal = 'Dinner';

  final List<String> selectedMeals = ['Breakfast', 'Lunch', 'Dinner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leave Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white, // Text color
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1F283E), // App bar background color
      ),
      body: Container(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: Image.asset('assets/food_leave_image.jpg').image,
              height: 240,
            ),
        DropdownButtonFormField<String>(
          value: selectedLeaveType,
          items: ['Single Leave', 'Long Term Leave'].map((leaveType) {
            return DropdownMenuItem<String>(
              value: leaveType,
              child: Text(
                leaveType,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedLeaveType = value!;
            });
          },
          decoration: InputDecoration(
            labelText: 'Select Leave Type',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Color(0xFF1F283E),
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        SizedBox(height: 20),
        if (selectedLeaveType == 'Single Leave')
          _buildSingleLeaveCard(),
        if (selectedLeaveType == 'Long Term Leave')
          _buildLongTermLeaveCard(),
          ],
        ),
      ),
      )

    );
  }

  Widget _buildSingleLeaveCard() {
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Single Meal Leave',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Please note that the leave will be applied for the date ${tomorrow.day}/${tomorrow.month}/${tomorrow.year}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: selectedMeals.contains('Breakfast'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedMeals.add('Breakfast');
                    } else {
                      selectedMeals.remove('Breakfast');
                    }
                  });
                },
              ),
              Text(
                'Breakfast',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 5),
              Checkbox(
                value: selectedMeals.contains('Lunch'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedMeals.add('Lunch');
                    } else {
                      selectedMeals.remove('Lunch');
                    }
                  });
                },
              ),
              Text(
                'Lunch',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 5),
              Checkbox(
                value: selectedMeals.contains('Dinner'),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedMeals.add('Dinner');
                    } else {
                      selectedMeals.remove('Dinner');
                    }
                  });
                },
              ),
              Text(
                'Dinner',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (selectedMeals.isNotEmpty) {
                showSuccessDialog(context,  "Success", selectedMeals);

              } else {
                print('Please select at least one meal to apply for leave');
              }
            },
            child: Text(
              'Apply',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 5, 53, 91), // Apply button color
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  int calculateTotalMeals() {
    int totalMeals = 0;

    // Calculate total meals if selectedStartDate and selectedEndDate are not null
    if (selectedStartDate != null && selectedEndDate != null) {
      // Calculate the difference in days between selectedStartDate and selectedEndDate
      int daysDifference = selectedEndDate.difference(selectedStartDate).inDays;

      // Adding one meal for the start day
      if (selectedStartMeal == 'Breakfast' || selectedStartMeal == 'Lunch' || selectedStartMeal == 'Dinner') {
        totalMeals++;
      }

      // Adding meals for the days in between
      totalMeals += (daysDifference * 3); // Assuming each day has 3 meals

      // Adding one meal for the end day
      if (selectedEndMeal == 'Breakfast' || selectedEndMeal == 'Lunch' || selectedEndMeal == 'Dinner') {
        totalMeals++;
      }
    }

    return totalMeals;
  }
  void showSuccessDialog(BuildContext context, String snackBarMessage, List<String> meals) {
    // Get the current date and time
    DateTime now = DateTime.now();
    FirebaseAuth _auth=FirebaseAuth.instance;

    // Get the user's email/name (replace this with your actual method to get the user's name)
    String? userName = _auth.currentUser?.displayName.toString(); // Replace with actual user's email/name

    DateTime tomorrow = now.add(Duration(days: 1)); // Adding one day to the current date

    FirebaseFirestore.instance.collection('leave_requests').add({
      'userName': userName,
      'dateTime': tomorrow,
      'mealsList': meals,
      'type': 'Single'
    })
        .then((value) {

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Row(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Text('Successfully applied for Leave for\n${tomorrow.day}/${tomorrow.month}/${tomorrow.year}'),
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
          });

  });
  }
  void saveDataAndShowDialog() {
    Timestamp startTimestamp = Timestamp.fromDate(selectedStartDate);
    Timestamp endTimestamp = Timestamp.fromDate(selectedEndDate);

    FirebaseAuth _auth=FirebaseAuth.instance;
    String? username=_auth.currentUser?.displayName;
    FirebaseFirestore.instance.collection('leave_requests').add({
      'userName': username,
      'selectedStartDateTime': startTimestamp, // Use selectedStartDateTime instead of dateTime
      'selectedEndDateTime': endTimestamp, // Use selectedEndDateTime instead of dateTime
      'startMeal': selectedStartMeal,
      'endMeal': selectedEndMeal,
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
                Text('Successfully applied from date\n'+selectedStartDate.toString()+' to\n '+selectedEndDate.toString()+'\nHappy holidays!'),
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
  Widget _buildLongTermLeaveCard() {
  return SingleChildScrollView(
    child: Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Long Term Leave',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  selectedStartDate != null
                      ? "From: ${selectedStartDate!.toLocal()}".split(' ')[0]
                      : "Select Starting Date",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedStartDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (picked != null && picked != selectedStartDate) {
                      setState(() {
                        selectedStartDate = picked;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        selectedStartDate != null
                            ? "${selectedStartDate!.toLocal()}".split(' ')[0]
                            : 'Select Starting Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedStartMeal,
              items: ["Breakfast", "Lunch", "Dinner"].map((meal) {
                return DropdownMenuItem<String>(
                  value: meal,
                  child: Text(
                    meal,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStartMeal = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Select Meal for Starting Date",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  selectedEndDate != null
                      ? "To: ${selectedEndDate!.toLocal()}".split(' ')[0]
                      : "Select Ending Date",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedEndDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (picked != null && picked != selectedEndDate) {
                      setState(() {
                        selectedEndDate = picked;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        selectedEndDate != null
                            ? "${selectedEndDate!.toLocal()}".split(' ')[0]
                            : 'Select Ending Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedEndMeal,
              items: ["Breakfast", "Lunch", "Dinner"].map((meal) {
                return DropdownMenuItem<String>(
                  value: meal,
                  child: Text(
                    meal,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEndMeal = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Select Meal for Ending Date",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
    
                if (selectedMeals.isNotEmpty) {
                  saveDataAndShowDialog();
                } else {
                  print('Please select at least one meal to apply for leave');
                }
              },
              child: Text(
                'Apply',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 5, 53, 91), // Apply button color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
