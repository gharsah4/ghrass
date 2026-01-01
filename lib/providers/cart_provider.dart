import 'package:flutter/material.dart';
import '../pages/cart.dart';
import '../widgets/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItems> _items = [];

  List<CartItems> get items => _items;

  double get total =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItem(CartItems item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItems item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}