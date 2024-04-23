import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Announcement model
class Announcement {
  final String title;
  final String description;
  final DateTime timestamp;

  Announcement({
    required this.title,
    required this.description,
    required this.timestamp,
  });
}

class AnnouncementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('announcements')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          List<Announcement> announcements = snapshot.data!.docs
              .map((doc) => Announcement(
            title: doc['title'],
            description: doc['description'],
            timestamp: (doc['timestamp'] as Timestamp).toDate(),
          ))
              .toList();
          return ListView.builder(
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              return AnnouncementCard(announcement: announcements[index]);
            },
          );
        },
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(announcement.title),
        subtitle: Text(announcement.description),
        trailing: Text(
          '${announcement.timestamp.day}/${announcement.timestamp.month}/${announcement.timestamp.year}',
        ),
      ),
    );
  }
}


