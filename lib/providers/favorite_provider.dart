import 'package:flutter/material.dart';
import 'package:nyntra/models/products.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<product> _favorites = [];
  List<product> get favorite => _favorites;

  void toggleFavorite(product Product) {
    if (_favorites.contains(Product)) {
      _favorites.remove(Product);
    } else {
      _favorites.add(Product);
    }
    notifyListeners();
  }

  bool isExist(product Product) {
    final isExist = _favorites.contains(Product);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
