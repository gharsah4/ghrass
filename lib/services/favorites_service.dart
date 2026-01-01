import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  /// مرجع المفضلة لليوزر الحالي
  CollectionReference<Map<String, dynamic>> get _favoritesRef =>
      _firestore
          .collection('users')
          .doc(_userId)
          .collection('favorites');

  /// ===============================
  /// هل المنتج مضاف للمفضلة (❤️)
  /// ===============================
  Stream<bool> isFavorite(String productId) {
    return _favoritesRef
        .doc(productId)
        .snapshots()
        .map((doc) => doc.exists);
  }

  /// ===============================
  /// إضافة / حذف مفضلة
  /// ===============================
  Future<void> toggleFavorite({
    required String productId,
    required Map<String, dynamic> productData,
    required bool isFavorite,
  }) async {
    final docRef = _favoritesRef.doc(productId);

    if (isFavorite) {
      // حذف من المفضلة
      await docRef.delete();
    } else {
      // إضافة للمفضلة
      await docRef.set(productData);
    }
  }

  /// ===============================
  /// جلب كل المفضلات (صفحة المفضلة)
  /// ===============================
  Stream<QuerySnapshot<Map<String, dynamic>>> favoritesStream() {
    return _favoritesRef.snapshots();
  }
}
