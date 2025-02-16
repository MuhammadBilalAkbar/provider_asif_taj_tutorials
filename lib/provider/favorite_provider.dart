import 'package:flutter/material.dart';

class FavoriteItemProvider with ChangeNotifier {
  final List<int> _favorite = [];

  List<int> get favorites => _favorite;

  void addFavorite(int index) {
      _favorite.add(index);
    notifyListeners();
  }

  void removeFavorite(int index) {
    _favorite.remove(index);
    notifyListeners();
  }
}
