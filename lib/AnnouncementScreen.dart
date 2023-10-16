import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image(
              image: Image.asset('assets/announcements.png').image,
              height: 200.0,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 40, 62), // Background color
                  borderRadius: BorderRadius.circular(16.0), // Rounded borders
                ),
                padding: EdgeInsets.all(16.0), // Padding for the container
                child: Stack(
                  children: [
                    Text(
                      "Announcements!",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white, // Title text color
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: ListView(
                        children: [
                          AnnouncementCard(
                              "Chola will be there instead of Rajma",
                              "23/10/23"),
                          AnnouncementCard(
                              "Mess timing will remain as regular on the occasion of Holi",
                              "13/10/23"),
                          AnnouncementCard(
                              "Students are advised to take glasses to sink after eating",
                              "2/10/23"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;

  AnnouncementCard(this.title, this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 31, 40, 62), // Title text color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Date: $date",
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0), // Date text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
