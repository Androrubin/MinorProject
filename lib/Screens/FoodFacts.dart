import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';



class FoodFactsScreen extends StatefulWidget {
  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}
class _SuggestionScreenState extends State<FoodFactsScreen> {
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    getSuggestions();
  }

  Future<void> getSuggestions() async {
    List<String> result = await OpenFoodAPIClient.getSuggestions(
      TagType.COUNTRIES,
      input: 'Tun',
      language: OpenFoodFactsLanguage.FRENCH,
    );
    setState(() {
      suggestions = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
      ),
      body: suggestions.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(suggestions[index]),
            ),
          );
        },
      ),
    );
  }
}