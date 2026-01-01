// services/cart_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/cart_item.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? get uid => FirebaseAuth.instance.currentUser?.uid;

  CollectionReference get carts => _firestore.collection('carts');

  Future<void> saveCart(List<CartItems> cartItems) async {
    if (uid == null) return;

    final items = cartItems.map((e) => e.toJson()).toList();
    await carts.doc(uid).set({
      'items': items,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<CartItems>> loadCart() async {
    if (uid == null) return [];

    final doc = await carts.doc(uid).get();
    if (!doc.exists) return [];

    final data = doc.data() as Map<String, dynamic>;
    final List items = data['items'] ?? [];
    return items.map((e) => CartItems.fromJson(e)).toList();
  }

  Future<void> clearCart() async {
    if (uid == null) return;
    await carts.doc(uid).delete();
  }

  Stream<List<CartItems>> cartStream() {
    if (uid == null) return Stream.value([]);
    return carts.doc(uid).snapshots().map((snapshot) {
      if (!snapshot.exists) return [];
      final data = snapshot.data() as Map<String, dynamic>;
      final List items = data['items'] ?? [];
      return items.map((e) => CartItems.fromJson(e)).toList();
    });
  }
}
