import 'package:flutter/material.dart';

class ExtraItemHistory extends StatefulWidget {
  const ExtraItemHistory({super.key});

  @override
  State<ExtraItemHistory> createState() => _ExtraItemHistoryState();
}

class _ExtraItemHistoryState extends State<ExtraItemHistory> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(class_name());

    List<Map<String, dynamic>> itemList = [
      {'itemName': 'Food', 'quantity': 1, 'price': 10.99},
      {'itemName': 'Item 2', 'quantity': 2, 'price': 5.99},
      {'itemName': 'Item 3', 'quantity': 3, 'price': 15.99},
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Extra Item",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(30),
            //   child: Text(
            //     "Extra Item History",
            //     style: TextStyle(
            //       fontSize: 22,
            //       color: const Color.fromARGB(255, 240, 197, 105),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = itemList[index];
                  final itemName = item['itemName'];
                  final quantity = item['quantity'];
                  final price = item['price'];

                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.only(bottom: 8),
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/Nature.jpg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  'Item Name: $itemName',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Quantity: $quantity',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Price: \$${price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
