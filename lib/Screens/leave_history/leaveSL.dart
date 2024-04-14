
import 'package:flutter/material.dart';

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
class LeaveHistoryPage extends StatelessWidget {
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
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/historypage.png",
              height: 35,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(top:110),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25, // Distance from top
                  ),
                  Card(
                    color: Color.fromARGB(255, 217, 109, 14),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SingleMealHistoryPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Text('Single Meal Leave History', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20, // Distance between cards
                  ),
                  Card(
                    color: Colors.green,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LongTermLeaveHistoryPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Text('Long Term Leave History', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
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
}


class SingleMealHistoryPage extends StatelessWidget {
  // Sample data for demonstration
  final List<Map<String, dynamic>> mealData = [
    {'date': '20-04-2024', 'meals': ['Breakfast', 'Dinner', 'Lunch']},
    {'date': '21-04-2024', 'meals': ['Lunch', 'Dinner']},
    {'date': '22-04-2024', 'meals': ['Breakfast', 'Dinner']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Meal Leave History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 98, 193, 241),
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
        backgroundColor: Color.fromARGB(255, 46, 103, 8),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
           height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 25,
          child: ListView.builder(
            padding: EdgeInsets.only(top:30),
            itemCount: mealData.length,
            itemBuilder: (context, index) {
              final meal = mealData[index];
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
                        _buildRowWithIcon('Date', meal['date'], Icons.date_range_outlined),
                        SizedBox(height: 16),
                        _buildRowWithIcon('Meals', meal['meals'].join(', '), Icons.restaurant_menu_outlined),
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


class LongTermLeaveHistoryPage extends StatelessWidget {
  // Sample data for demonstration
  final List<Map<String, String>> leaveData = [
    {'startDate': '20-04-2024', 'endDate': '28-04-2024', 'startMeal': 'Breakfast', 'endMeal': 'Lunch'},
    {'startDate': '20-04-2024', 'endDate': '28-04-2024', 'startMeal': 'Dinner', 'endMeal': 'Breakfast'},
    {'startDate': '20-04-2024', 'endDate': '28-04-2024', 'startMeal': 'Lunch', 'endMeal': 'Dinner'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Long Term Leave History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 98, 136, 241),
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
        backgroundColor: const Color.fromARGB(255, 117, 243, 33),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 25,

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
                      _buildRowWithIcon('Start Date', leave['startDate']!, Icons.date_range_outlined),
                      // SizedBox(width: 20,),
                      _buildRowWithIcon('Start Meal', leave['startMeal']!, Icons.restaurant_menu_outlined),
                      SizedBox(height: 16),
                      _buildRowWithIcon('End Date', leave['endDate']!, Icons.date_range_outlined),
                      _buildRowWithIcon('End Meal', leave['endMeal']!, Icons.restaurant_menu_outlined),
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
            Text(label, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
          ],
        ),
        Text(value,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
      ],
    );
  }
}



