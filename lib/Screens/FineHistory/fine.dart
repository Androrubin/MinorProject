import 'package:flutter/material.dart';

class Fine {
  final String date;
  final String details;
  final int amount;

  Fine({required this.date, required this.details, required this.amount});
}

class MessFineHistoryPage extends StatelessWidget {
  final List<Fine> fines = [
    Fine(date: "2024-04-28", details: "Indiscipline in mess", amount: 50),
    Fine(date: "2024-04-26", details: "Bursting crackers", amount: 75),
    Fine(date: "2024-04-22", details: "Playing Holi on mess floor", amount: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mess Fine History", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF1F283E),
      ),
      body: ListView.builder(
        itemCount: fines.length,
        itemBuilder: (context, index) {
          return _buildFineCard(fines[index]);
        },
      ),
    );
  }

  Widget _buildFineCard(Fine fine) {
    return Card(
      color: Colors.grey,
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date: ${fine.date}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Details: ${fine.details}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Amount: ",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Text(
              "₹${fine.amount}",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
