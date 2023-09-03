import 'package:flutter/foundation.dart';
import 'facility.dart';

class FavoriteFacilityNotifier with ChangeNotifier {
  List<String> _favoriteFacilities = [];

  List<String> get favoriteFacilities => _favoriteFacilities;

  bool isFavorite(Facility facility) {
    return _favoriteFacilities.contains(facility);
  }

  void addFavorite(String facilityID) {
    _favoriteFacilities.add(facilityID);
    notifyListeners();
  }

  void removeFavorite(String facilityID) {
    _favoriteFacilities.remove(facilityID);
    notifyListeners();
  }

  void toggleFavorite(Facility facility) {
    if (_favoriteFacilities.contains(facility.id)) {
      _favoriteFacilities.remove(facility.id);
    } else {
      _favoriteFacilities.add(facility.id);
    }
    notifyListeners();
  }

   void clearFavorites() {
    _favoriteFacilities.clear();
    notifyListeners();
  } 
}