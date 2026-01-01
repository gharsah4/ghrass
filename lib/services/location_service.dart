import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LocationService {
  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ✅ حفظ موقع خاص بالمستخدم الحالي
  static Future<void> saveLocation({
    required String name,
    required LatLng location,
    required String address,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('locations')
        .add({
      'name': name,
      'latitude': location.latitude,
      'longitude': location.longitude,
      'address': address,
      'createdAt': Timestamp.now(),
    });
  }

  /// ✅ جلب المواقع الخاصة بالمستخدم الحالي فقط
  static Future<List<Map<String, dynamic>>> getLocations() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('locations')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }
}
