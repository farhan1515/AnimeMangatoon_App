import 'package:hive_flutter/hive_flutter.dart';

class FavoritesService {
  Box<String> get favoritesBox => Hive.box<String>('favoritesBox');

  // Get saved favorites
  List<String> getFavorites() {
    return favoritesBox.values.toList();
  }

  // Save a new favorite
  void saveFavorite(String title) {
    if (!favoritesBox.values.contains(title)) {
      favoritesBox.add(title);
    }
  }

  // Remove a favorite
  void removeFavorite(String title) {
    final favoriteKey = favoritesBox.keys.firstWhere(
      (key) => favoritesBox.get(key) == title,
      orElse: () => -1,
    );
    if (favoriteKey != -1) {
      favoritesBox.delete(favoriteKey);
    }
  }

  // Check if an item is a favorite
  bool isFavorite(String title) {
    return favoritesBox.values.contains(title);
  }
}