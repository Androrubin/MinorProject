

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Extras extends StatefulWidget {
  const Extras({Key? key}) : super(key: key);

  @override
  State<Extras> createState() => _ExtrasState();
}

class MenuItem {
  final String itemName;
  final int quantity;
  final double rate;

  MenuItem({required this.itemName, required this.quantity, required this.rate});
}

class DateItem {
  final String date;
  final Map<String, List<MenuItem>> mealItems;
  bool isExpanded;

  DateItem({required this.date, required this.mealItems, this.isExpanded = false});
}

class _ExtrasState extends State<Extras> {
  List<DateItem> dateItems = [
    DateItem(
      date: "April 10, 2024",
      mealItems: {
        "Breakfast": [
          MenuItem(itemName: "Toast", quantity: 2, rate: 1.5),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 2.0),
        ],
        "Lunch": [
          MenuItem(itemName: "Salad", quantity: 1, rate: 3.5),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 4.0),
        ],
        "Dinner": [
          MenuItem(itemName: "Juice", quantity: 1, rate: 8.0),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 6.0),
        ],
      },
    ),
    DateItem(
      date: "April 11, 2024",
      mealItems: {
        "Breakfast": [
          MenuItem(itemName: "Toast", quantity: 2, rate: 1.5),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 2.0),
        ],
        "Lunch": [
          MenuItem(itemName: "Salad", quantity: 1, rate: 3.5),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 4.0),
        ],
        "Dinner": [
          MenuItem(itemName: "Juice", quantity: 1, rate: 8.0),
          MenuItem(itemName: "Eggs", quantity: 1, rate: 6.0),
        ],
      },
    ),
    DateItem(
      date: "April 12, 2024",
      mealItems: {
        "Breakfast": [
          MenuItem(itemName: "Bhurji", quantity: 1, rate: 15),
          MenuItem(itemName: "Dahi", quantity: 1, rate: 2.0),
        ],
        "Lunch": [
          MenuItem(itemName: "Salad", quantity: 1, rate: 3.5),
          MenuItem(itemName: "Chips", quantity: 1, rate: 4.0),
        ],
        "Dinner": [
          MenuItem(itemName: "Juice", quantity: 1, rate: 8.0),
          MenuItem(itemName: "Biscuit", quantity: 1, rate: 6.0),
        ],
      },
    ),
    // Add more DateItem entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Extra Item History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,

          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1F283E),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children:[
              SizedBox(height: 30,),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/food_image2_leave_history.jpg',
                        width: 350,
                        color: Colors.black.withOpacity(0.4),
                        colorBlendMode: BlendMode.multiply,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Extra Item History',
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'See all your extra items history with date and never be unaware of your mess credits!',style: TextStyle( fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () async {


                              },
                              child: Text(
                                'View',
                                style: GoogleFonts.outfit(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
              padding: EdgeInsets.only(top: 30),
              shrinkWrap: true,
              itemCount: dateItems.length,
              itemBuilder: (BuildContext context, int index) {
                DateItem dateItem = dateItems[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            dateItem.isExpanded = !dateItem.isExpanded;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dateItem.date,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                Icon(dateItem.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (dateItem.isExpanded)
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: dateItem.mealItems.entries.map((entry) {
                              String mealCategory = entry.key;
                              List<MenuItem> items = entry.value;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mealCategory,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: items.map((item) {
                                      return Card(
                                        elevation: 4,
                                        margin: EdgeInsets.symmetric(vertical: 4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.itemName,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Quantity: ${item.quantity}",
                                                  ),
                                                  Text(
                                                    "Rate: \$${item.rate}",
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
        ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Extras(),
//   ));
// }
