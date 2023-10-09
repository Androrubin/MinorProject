import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:messmaven_minor_project/nav_screens/account_screen.dart';
import 'package:messmaven_minor_project/nav_screens/extras_screen.dart';
import 'package:messmaven_minor_project/nav_screens/home_screen.dart';
import 'package:messmaven_minor_project/nav_screens/surveys_screen.dart';

Color cardColor = const Color(0xFF1F283E);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    HomeScreen(),
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
          },
        ),
      ),
    );
  }
}


