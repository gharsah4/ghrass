import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrdersService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createOrder({
    required List<Map<String, dynamic>> items,
    required double total,
  }) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) throw Exception('User not logged in');

    await _updateCurrentOrdersToDelivered(currentUser.uid);

    final docRef = await _firestore.collection('orders').add({
      'items': items,
      'total': total,
      'status': 'current',
      'createdAt': FieldValue.serverTimestamp(),
      'userId': currentUser.uid,
    });

    return docRef.id;
  }

  Future<void> _updateCurrentOrdersToDelivered(String userId) async {
    try {
      final QuerySnapshot currentOrders = await _firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .where('status', isEqualTo: 'current')
          .get();

      final batch = _firestore.batch();
      for (var doc in currentOrders.docs) {
        batch.update(doc.reference, {
          'status': 'delivered',
          'deliveredAt': FieldValue.serverTimestamp(),
        });
      }

      await batch.commit();
    } catch (e) {
      print('خطأ في تحديث الطلبات: $e');
    }
  }

  Stream<List<OrderModel>> getOrders(String userId, bool showCurrent) {
    return _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: showCurrent ? 'current' : 'delivered')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => OrderModel.fromFirestore(doc))
          .toList();
    });
  }
}