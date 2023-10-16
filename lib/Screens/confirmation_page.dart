import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/models/food_items.dart';
import 'package:intl/intl.dart';

Color themecolor = Color(0xFF1F283E);
Color searchBarcolor = Color(0xFF9EA2AD);
Color cardColor = Color.fromRGBO(0x74, 0x74, 0x74, 0.08);
Color textColor = Color(0xFF36454F);

class ConfirmationPage extends StatelessWidget {
  final List<FoodItem> selectedItems;
  final int totalPrice;

  ConfirmationPage({
    required this.selectedItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/tick_mark.jpeg",
                width: 240,
                height: 240,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "₹$totalPrice",
                style: TextStyle(
                  color: themecolor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Order Number: 21124102",
                style: TextStyle(
                  color: themecolor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "Order Time: ${DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now())}",
                style: TextStyle(
                  color: themecolor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themecolor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListView.builder(
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    final item = selectedItems[index];
                    return ListTile(
                      title: Text(item.name,style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Text("₹${item.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
