import 'package:flutter/foundation.dart';
import 'equipment.dart';

class FavoriteEquipmentNotifier with ChangeNotifier {
  List<String> _favoriteEquipment = [];

  List<String> get favoriteEquipment => _favoriteEquipment;

  bool isFavorite(Equipment equipment) {
    return _favoriteEquipment.contains(equipment);
  }

  void addFavorite(String equipmentID) {
    _favoriteEquipment.add(equipmentID);
    notifyListeners();
  }

  void removeFavorite(String equipmentID) {
    _favoriteEquipment.remove(equipmentID);
    notifyListeners();
  }

  // Method to add or remove equipment from favorites
  void toggleFavorite(Equipment equipment) {
    if (_favoriteEquipment.contains(equipment.id)) {
      _favoriteEquipment.remove(equipment.id);
    } else {
      _favoriteEquipment.add(equipment.id);
    }
    notifyListeners();
  }

  void clearFavorites() {
    _favoriteEquipment.clear();
    notifyListeners();
  }
}