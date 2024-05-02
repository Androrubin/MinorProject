import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/Screens/place_order.dart';
import 'package:messmaven_minor_project/models/food_items.dart';

class ExtraPage extends StatefulWidget {
  const ExtraPage({ Key? key}): super(key:key);

  @override
  State<ExtraPage> createState() => _ExtraPageState();
}

Color themecolor = Color(0xFF1F283E);
Color searchBarcolor = Color(0xFF9EA2AD);
Color cardColor = Color.fromRGBO(0x74, 0x74, 0x74, 0.08);
Color textColor = Color(0xFF36454F);
final List<FoodItem> selectedItems =[];
List<FoodItem>filteredItems=[];
final TextEditingController searchController = TextEditingController();
bool showFilteredItems = false;
bool isButtonVisible = false;





class _ExtraPageState extends State<ExtraPage>{

  String searchText = '';

  void updateFilteredItems() {

    final searchText = searchController.text.toLowerCase();
    filteredItems = food_item
        .where((item) => item.name.toLowerCase().contains(searchText))
        .toList();
    showFilteredItems = filteredItems.isNotEmpty;
    setState(() {});
  }

  void showErrorSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Select at leat one item to proceed'),
      duration: Duration(seconds: 3), // Optional: Set the duration for how long the snackbar should be visible.
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void  navigateToPlaceOrderPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceOrderPage(selectedItems: selectedItems),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;

    setState(() {
      isButtonVisible = selectedItems.isNotEmpty;
    });

    return Scaffold(
      backgroundColor: themecolor,
      body:
        SafeArea(
          child:
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                        Text('Hungry!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),),

                            Visibility(
                              visible: true, // Show the button when there are selected items
                              child: InkWell(
                                onTap: () {
                                  if (selectedItems.isNotEmpty) {
                                    navigateToPlaceOrderPage();
                                  } else {
                                    showErrorSnackBar(context);
                                  }
                                },
                                child: Container(
                                  width: 60, // Set the width of the circular button
                                  height: 60, // Set the height of the circular button
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, // Make it circular
                                    color: Colors.white, // Set the background color to white
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2), // Add a shadow to the button (optional)
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: themecolor, // Set the arrow color to blue
                                      size: 30, // Set the arrow size
                                    ),
                                  ),
                                ),
                              ),
                            )


                      ] ),
                      Row(children:[
                        Text('grab some snacks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),)

                      ] ),

                       SizedBox(
                         height:16,
                       ),

              Container(
                      decoration: BoxDecoration(
                        color: searchBarcolor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(children:[
                         SizedBox(width: 25,),
                        Icon(
                              Icons.search,
                              color: Colors.white,
                        ),

                  Expanded(
                    child: TextField(
                      controller: searchController,

                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                          updateFilteredItems();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search the food item you want',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                      ] ),
              ),
                    ],
                  ),
                ),

                SizedBox(
                  height:20,
                ),

            Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
             child: GridView.builder(
               itemCount: showFilteredItems ? filteredItems.length : food_item.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 4,
                 crossAxisSpacing: 16,
                 childAspectRatio: 0.75,
               ),
               itemBuilder: (context, index) {
                 final foodItem = showFilteredItems ? filteredItems[index] : food_item[index]; // Use the correct food item based on showFilteredItems
                 return ItemCard(key: UniqueKey(), foodItem: foodItem);
               },
             ),
            ),
            ),
                



            ],
             ),
        )
    );
  }
}







class ItemCard extends StatefulWidget {
  final FoodItem foodItem;
  // final Function press;
  const ItemCard({
    required Key key,
    required this.foodItem,
    //   required this.press
  }) : super(key: key);


  @override
  _ItemCardState createState() => _ItemCardState();
}


class _ItemCardState extends State<ItemCard> {
  void toggleItemSelection(FoodItem item) {
    setState(() {
      if (item.isSelected) {
        selectedItems.remove(item); // Deselect: Remove from the list
      } else {
        selectedItems.add(item); // Select: Add to the list
      }
      item.isSelected = !item.isSelected; // Toggle the selected state
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toggle the selection state when the card is tapped
        setState(() {
          toggleItemSelection(widget.foodItem);
        });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: widget.foodItem.isSelected ? 10 : 5,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.foodItem.isSelected
                      ? Colors.blue[200]
                      : cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Image.asset(
                          widget.foodItem.image,
                          width: 120,
                          height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            widget.foodItem.name,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.foodItem.price.toString(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Visibility(
                                    visible: widget.foodItem.isSelected,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/icons/tick.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),

                                  Visibility(
                                    visible: !widget.foodItem.isSelected,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/icons/add_item.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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


class SelectedItemsPage extends StatelessWidget {
  final List<FoodItem> selectedItems;

  SelectedItemsPage({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          final item = selectedItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.price.toString()),
            // Add any other information you want to display
          );
        },
      ),
    );
  }
}