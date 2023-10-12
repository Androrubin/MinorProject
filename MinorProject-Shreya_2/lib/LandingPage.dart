import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/LeaveFragment.dart';
import 'LeaveFragment.dart';
import 'CompleteMenuScreen.dart';
import 'AnnouncementScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedDay = 'Monday'; // Initial selected day
  Map<String, List<String>> menuMap = {
    'Monday': [
      'Scrambled Eggs, Bacon, Toast',
      'Grilled Chicken, Rice, Salad',
      'Pasta with Marinara Sauce, Garlic Bread'
    ],
    'Tuesday': [
      'Oatmeal with Berries',
      'Turkey Wrap with Veggies',
      'Salmon with Quinoa and Roasted Veggies'
    ],
    'Wednesday': ['chole bhature', 'Pulav Chole', 'Aloo-Bhujia'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mess Maven"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), // Bell icon
            onPressed: () {
              // Navigate to the announcements screen when the bell icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnnouncementsScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 31, 40, 62),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Opacity(
              opacity: 0.75,
              child: Image(
                image: AssetImage('assets/mess_top_title.png'),
                height: 180.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: const Text(
                      "Today's Menu",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 31, 40, 62),
                      ),
                    ),
                  ),
                  buildMenuCard(
                    Color.fromARGB(255, 31, 40, 62),
                    'Breakfast',
                    getMenu(selectedDay, 0),
                  ),
                  buildMenuCard(
                    const Color.fromARGB(255, 31, 40, 62),
                    'Lunch',
                    getMenu(selectedDay, 1),
                  ),
                  buildMenuCard(
                    const Color.fromARGB(255, 31, 40, 62),
                    'Dinner',
                    getMenu(selectedDay, 1),
                  ),
                  buildMenuCardWithLink(),
                  InkWell(
                    child: Image(
                      image: AssetImage('assets/break.png'),
                      height: 70.0,
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveApplicationPage()));
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMenu(String day, int mealIndex) {
    if (menuMap.containsKey(day) && menuMap[day]!.length > mealIndex) {
      return menuMap[day]![mealIndex];
    }
    return 'Menu not available for this meal.';
  }

  Widget buildMenuCard(Color color, String title, String details) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: Card(
        color: color,
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 3.0, top: 0.0),
          child: Card(
            color: Color.fromARGB(255, 31, 40, 62),
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$title Menu:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuCardWithLink() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // Set the width to take up the complete width
      children: [
        InkWell(
          onTap: () {
            // Navigate to a new screen when clicked
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CompleteMenuScreen()));
          },
          child: const Card(
            color: Color.fromARGB(255, 31, 40, 62),
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'For complete menu, click here',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
