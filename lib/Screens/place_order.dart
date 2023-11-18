import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/models/food_items.dart';

import 'confirmation_page.dart';


class PlaceOrderPage extends StatefulWidget {
  final List<FoodItem> selectedItems;
  // Property to store the selected items

  const PlaceOrderPage({
    Key? key,
    required this.selectedItems,
  }) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

Color themecolor = Color(0xFF1F283E);
Color searchBarcolor = Color(0xFF9EA2AD);
Color cardColor = Color.fromRGBO(0x74, 0x74, 0x74, 0.08);
Color textColor = Color(0xFF36454F);
Color orangeCol = Color(0xFFFD8700);

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  List<FoodItem> _selectedItems = [];
  int totalPrice=0;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems;
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    int newTotalPrice = 0; // Initialize a temporary variable
    for (var item in _selectedItems) {
      newTotalPrice += item.itemCount * (item.price);
    }
    setState(() {
      totalPrice = newTotalPrice; // Update the total price
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: themecolor, // Change this color to the one you want
        ),
      ),
      backgroundColor: themecolor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 600),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Lets have all these snacks today',
                    style: TextStyle(
                      color: themecolor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Total: ',
                          style: TextStyle(
                            color: themecolor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹"+totalPrice.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _selectedItems.length,
                      itemBuilder: (context, index) {
                        return SelectedItemCard(
                          key: UniqueKey(),
                          selectedFoodItem: _selectedItems[index],
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              _selectedItems[index].itemCount = newQuantity;

                            });
                            calculateTotalPrice();
                            // Call the method to update the total price
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(selectedItems: _selectedItems,totalPrice: totalPrice,),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: Container(
                  width: 60, // Set the width of the circular button
                  height: 60, // Set the height of the circular button
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0), // Make it circular
                    color: Colors.white, // Set the background color to white
                  ),
                  child: Center(
                    child:Text(
                      'Buy Items',
                      style: TextStyle(
                        color: themecolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SelectedItemCard extends StatefulWidget {
  final FoodItem selectedFoodItem;
  final Function(int newQuantity) onQuantityChanged;
  // final Function press;
  const SelectedItemCard({
    required Key key,
    required this.selectedFoodItem,
    required this.onQuantityChanged,
    //   required this.press
  }) : super(key: key);


  @override
  _selectedItemCardState createState() => _selectedItemCardState();
}


class _selectedItemCardState extends State<SelectedItemCard> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toggle the selection state when the card is tapped

      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color:  cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Image.asset(
                          widget.selectedFoodItem.image ?? " ",
                          width: 100,
                          height: 100,
                        ),
                        Container(
                          width: 70,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        widget.selectedFoodItem.name,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "₹"+widget.selectedFoodItem.price.toString(),
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),


                        Container(
                          decoration: BoxDecoration(
                            color:  Colors.white,
                            // borderRadius: BorderRadius.circular(16),
                          ),

                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if(widget.selectedFoodItem.itemCount>1){
                                    widget.onQuantityChanged(
                                      widget.selectedFoodItem.itemCount - 1,
                                    );

                                  }
                                },
                                icon: Image.asset(
                                  "assets/icons/rem_item.png",
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              Text(
                                widget.selectedFoodItem.itemCount.toString(),
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  widget.onQuantityChanged(
                                    widget.selectedFoodItem.itemCount + 1,
                                  );

                                },
                                icon: Image.asset(
                                  "assets/icons/green_add.png",
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}