import 'package:flutter/material.dart';

import '../models/favorites.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoritesModel _favoritesModel = FavoritesModel();

  List<int> get favoriteItems => _favoritesModel.favoriteItems;

  void add(int itemNo) {
    _favoritesModel.favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoritesModel.favoriteItems.remove(itemNo);
    notifyListeners();
  }
}
