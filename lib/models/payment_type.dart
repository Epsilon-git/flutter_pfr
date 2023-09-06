// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentType {
  final String id;
  final String title;

  PaymentType({
    required this.id,
    required this.title,
  });

  factory PaymentType.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;

    return PaymentType(
      id: document.id,
      title: data['title'] as String,
    );
  }
}
