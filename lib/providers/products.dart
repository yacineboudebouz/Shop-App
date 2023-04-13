import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/constants/products.dart';
import 'package:shopapp/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = PRODUCTS;

  List<Product> get items {
    return [..._items];
  }

  Product findByID(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void assProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
