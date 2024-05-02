import 'package:flutter/material.dart';


class Announcement {
  final String date;
  final String title;
  final String description; // Description about the mess
  final String tag; // NEW or SEEN

  Announcement({
    required this.date,
    required this.title,
    required this.description,
    required this.tag,
  });
}


class AnnouncementsScreen extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementsScreen> {
  List<Announcement> announcements = [
    Announcement(
      date: 'May 1, 2024',
      title: 'Announcement 1',
      description: 'New menu introduced in the mess.',
      tag: 'NEW',
    ),
    Announcement(
      date: 'May 2, 2024',
      title: 'Announcement 2',
      description: 'Reminder: Mess will be closed on Sunday for maintenance.',
      tag: 'SEEN',
    ),
    Announcement(
      date: 'May 3, 2024',
      title: 'Announcement 3',
      description: 'Special dinner tonight to celebrate the hostel anniversary.',
      tag: 'NEW',
    ),
  ];

  List<Announcement> archivedAnnouncements = [];

  void archiveAnnouncement(Announcement announcement) {
    setState(() {
      announcements.remove(announcement);
      archivedAnnouncements.add(announcement);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Archived ${announcement.title}'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messs Announcements', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF1F283E),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Archived Announcements',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (var announcement in archivedAnnouncements)
              ListTile(
                title: Text(announcement.title),
                subtitle: Text(announcement.date),
              ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/announcement.jpg'),
              ),
              title: Text(announcement.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(announcement.date),
                  SizedBox(height: 4),
                  Text(announcement.description),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.archive),
                onPressed: () => archiveAnnouncement(announcement),
              ),
            ),
          );
        },
      ),
    );
  }
}
