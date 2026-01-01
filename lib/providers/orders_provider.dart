import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/order_model.dart';
import '../services/orders_service.dart';

class OrdersProvider extends ChangeNotifier {
  final OrdersService _service = OrdersService();

  bool showCurrent = true;

  void toggle(bool current) {
    showCurrent = current;
    notifyListeners();
  }

  Stream<List<OrderModel>> get ordersStream {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.value([]);
    }
    return _service.getOrders(user.uid, showCurrent);
  }
}
