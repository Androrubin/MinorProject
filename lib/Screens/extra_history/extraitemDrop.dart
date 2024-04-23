import 'package:flutter/material.dart';

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
  double totalRate;

  DateItem({required this.date, required this.mealItems, this.isExpanded = false})
      : totalRate = 0 {
    calculateTotalRate();
  }
  
  void calculateTotalRate() {
    totalRate =
        mealItems.values.expand((items) => items).map((item) => item.rate * item.quantity).reduce((a, b) => a + b);
  }
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
          MenuItem(itemName: "Toast", quantity: 2, rate: 3.5),
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
    // Add more DateItem entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Extra Item History",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: dateItems.map((dateItem) {
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
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${dateItem.date}     Amount: ₹${dateItem.totalRate.toStringAsFixed(2)}",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Icon(dateItem.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (dateItem.isExpanded)
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15),
                              child: Column(
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
                                      DataTable(
                                        columns: [
                                          DataColumn(label: Text('Item Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                                          DataColumn(label: Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold))),
                                          DataColumn(label: Text('Rate',style: TextStyle(fontWeight: FontWeight.bold))),
                                        ],
                                        rows: items.map((item) {
                                          return DataRow(cells: [
                                            DataCell(Text(item.itemName)),
                                            DataCell(Text(item.quantity.toString())),
                                            DataCell(Text("₹${item.rate.toStringAsFixed(2)}")),
                                          ]);
                                        }).toList(),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
