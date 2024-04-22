

class Review {
  final double rating;
  final String menuChanges;
  final String timingChanges;
  final String cleanliness;
  final String varietyOfDishes;

  Review({
    required this.rating,
    required this.menuChanges,
    required this.timingChanges,
    required this.cleanliness,
    required this.varietyOfDishes,
  });

  // Convert review data to a map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'menuChanges': menuChanges,
      'timingChanges': timingChanges,
      'cleanliness': cleanliness,
      'varietyOfDishes': varietyOfDishes,
    };
  }
}
