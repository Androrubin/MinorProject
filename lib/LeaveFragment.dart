import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class LeaveApplicationPage extends StatefulWidget {
  @override
  _LeaveApplicationPageState createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  bool? isSingleDayLeave = true;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
                // Perform leave application logic here
                if (isSingleDayLeave == true) {
                  // Handle single-day leave logic
                } else {
                  // Handle multi-day leave logic
                }

                // Close the confirmation dialog
                Navigator.of(context).pop();

                // Show a success message
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application'),
      ),
      body: Column(
        children: [
          Image(
            image: Image.asset('assets/takeleave.png').image,
            height: 250,
          ),
          Container(
            height: 400.0,
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: true,
                        groupValue: isSingleDayLeave,
                        onChanged: (value) {
                          setState(() {
                            isSingleDayLeave = value;
                          });
                        },
                      ),
                      Text('Single Day Leave',
                          style: TextStyle(color: Colors.white)),
                      Radio(
                        value: false,
                        groupValue: isSingleDayLeave,
                        onChanged: (value) {
                          setState(() {
                            isSingleDayLeave = value;
                          });
                        },
                      ),
                      Text('Multi-Day Leave',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  if (isSingleDayLeave == false) // Check for null or false
                    Column(
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Leave Dates:',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        DatePickerField(
                          label: 'Start Date',
                          selectedDate: startDate,
                          onDateSelected: (date) {
                            setState(() {
                              startDate = date;
                            });
                          },
                        ),
                        DatePickerField(
                          label: 'End Date',
                          selectedDate: endDate,
                          onDateSelected: (date) {
                            setState(() {
                              endDate = date;
                            });
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _applyLeave,
                    child: Text('Apply'),
                  ),
                ],
              ),
            ),
          ),
        ],
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
