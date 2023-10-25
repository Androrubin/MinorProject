import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class CompleteMenuScreen extends StatefulWidget {
  @override
  _CompleteMenuScreenState createState() => _CompleteMenuScreenState();
}

class _CompleteMenuScreenState extends State<CompleteMenuScreen> {
  String selectedDay = 'Monday'; // Initial selected day
  Map<String, List<String>> menuMap = {
    'Monday': [
      'Aloo Paratha, Curd, Pickle',
      'Rajma, Rice, Salad',
      'Bhindi Masala, Roti, Salad'
    ],
    'Tuesday': [
      'Vada Pav, chutney',
      'Kadhi Chawal, Salad',
      'Chiken Biryani, Raita'
    ],
    'Wednesday': [
      'chole bhature',
      'Pulav Chole',
      'Aloo-Bhujia',
      'Chicken Biryani', // Non-veg item
      'Mutton Curry', // Non-veg item
    ],
    // Add menu for the rest of the days
    'Thursday': ['Menu item 1', 'Menu item 2', 'Menu item 3'],
    'Friday': ['Menu item 1', 'Menu item 2', 'Menu item 3'],
    'Saturday': ['Menu item 1', 'Menu item 2', 'Menu item 3'],
    'Sunday': ['Mutton Korma', 'Menu item 2', 'Menu item 3'],
  };

  List<String> getDayList() {
    return menuMap.keys.toList();
  }

  bool isNonVegDay(String day) {
    return menuMap.containsKey(day) &&
        menuMap[day]!.any((menu) =>
            menu.toLowerCase().contains('chicken') ||
            menu.toLowerCase().contains('mutton'));
  }

  Widget buildMenuCard(
    String day,
    Color cardColor,
    String title,
    List<String> details,
  ) {
    return Card(
      color: cardColor,
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$day Menu:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 31, 40, 62),
              ),
            ),
            isNonVegDay(day)
                ? Text(' (Non-Veg Available)',
                    style: TextStyle(
                        color: Color.fromARGB(255, 31, 40, 62), fontSize: 14))
                : Container(),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
        children: [
          Card(
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Breakfast',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details[0],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Lunch',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details[1],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dinner',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    details[2],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 40, 62),
      appBar: AppBar(
        title: Text('Complete Menu'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: const Text(
              "Complete Menu",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          for (String day in getDayList())
            buildMenuCard(
              day,
              isNonVegDay(day) ? Colors.red : Colors.white,
              'Meals',
              getMenu(day),
            ),
        ],
      ),
    );
  }

  List<String> getMenu(String day) {
    if (menuMap.containsKey(day)) {
      return menuMap[day]!;
    }
    return ['Menu not available for this day.'];
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complete Menu',
      home: CompleteMenuScreen(),
    );
  }
}
