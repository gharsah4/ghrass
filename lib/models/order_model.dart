import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String status;
  final double total;
  final DateTime date;
  final List<Map<String, dynamic>> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.total,
    required this.date,
    required this.items,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return OrderModel(
      id: doc.id,
      status: data['status'] ?? 'current',
      total: (data['total'] as num).toDouble(),
      date: (data['createdAt'] as Timestamp).toDate(),
      items: List<Map<String, dynamic>>.from(data['items'] ?? []),
    );
  }
}