import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/nav_screens/home_screen.dart';
import 'package:messmaven_minor_project/nav_screens/surveys_screen.dart';
import 'account_screen.dart';
import 'extras_screen.dart';


Color cardColor = const Color(0xFF1F283E);

class BaseScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<BaseScreen> {
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
          backgroundColor: cardColor,
          cornerRadius: 0,
          height: 50,// Navigation bar background color
          style: TabStyle.reactCircle, // Modern style
          curveSize: 90, // Curve size for the icons
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

