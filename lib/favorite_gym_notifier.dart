import 'package:flutter/foundation.dart';
import 'gym.dart';

class FavoriteGymNotifier with ChangeNotifier {
  List<String> _favoriteGyms = [];

  List<String> get favoriteGyms => _favoriteGyms;

  bool isFavorite(Gym gym) {
    return _favoriteGyms.contains(gym);
  }

  void addFavorite(String gymID) {
    _favoriteGyms.add(gymID);
    notifyListeners();
  }

  void removeFavorite(String gymID) {
    _favoriteGyms.remove(gymID);
    notifyListeners();
  }

  // Method to dad or remove gym from favorites
  void toggleFavorite(Gym gym) {
    if (_favoriteGyms.contains(gym.id)) {
      _favoriteGyms.remove(gym.id);
    } else {
      _favoriteGyms.add(gym.id);
    }
    notifyListeners();
  }

  void clearFavorites() {
    _favoriteGyms.clear();
    notifyListeners();
  }
}