import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items!};
  }

  void addItem(String producrId, double price, String title) {
    if (_items.containsKey(producrId)) {
      _items.update(
        producrId,
        (existingValue) => CartItem(
          id: existingValue.id,
          title: existingValue.title,
          price: existingValue.price,
          quantity: existingValue.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        producrId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}
