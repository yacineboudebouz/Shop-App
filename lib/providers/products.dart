import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/constants/products.dart';
import 'package:shopapp/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = PRODUCTS;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    // } else {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  // void assProduct() {
  //   // _items.add(value);
  //   notifyListeners();
  // }

  // var _showFavoritesOnly = false;
  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
  void addProduct() {
    notifyListeners();
  }
}
