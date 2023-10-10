import 'package:flutter/material.dart';

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    ApoorvHomeScreen(), // Add Apoorv's HomeScreen here
    ExtrasScreen(),
    SurveysScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _fragments[_currentIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: cardColor, // Navigation bar background color
          style: TabStyle.react, // Modern style
          curveSize: 60, // Curve size for the icons
          items: [
            TabItem(
              icon: Icons.home,
              title: 'Home',
            ),
            TabItem(
              icon: Icons.search,
              title: 'Search',
            ),
            TabItem(
              icon: Icons.favorite,
              title: 'Favorites',
            ),
            TabItem(
              icon: Icons.person,
              title: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            if (index == 0) {
              // Handle the Home tab click, return to Apoorv's HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ApoorvHomeScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ApoorvHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: AnimatedBuilder(
              // Rest of Apoorv's code for the Home screen
              // ...
            ),
          ),
          const SizedBox(height: 20),
          const Text("Mess Maven",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const Text("A less messy mess!",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
