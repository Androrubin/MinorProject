
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
        backgroundColor: Colors.blue, // App bar background color
      ),
      body: Container(
        margin: EdgeInsets.only(top:30),
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  color: Colors.black54
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
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: TextStyle(fontSize: 18),
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
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
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
          SizedBox(height: 16),
          Column(
            children: [
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
              ],
          ),
              SizedBox(height: 10),
              Row(
                children: [
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
              ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
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
                // Proceed with single meal leave
                print('Applying for single meal leave for $selectedMeals');
              } else {
                // Show error message or handle empty selection
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
      ]
    ),
  )
  );
  
}





  Widget _buildLongTermLeaveCard() {
  return Card(
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
                // Proceed with single meal leave
                print('Applying for single meal leave for $selectedMeals');
              } else {
                // Show error message or handle empty selection
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

}
