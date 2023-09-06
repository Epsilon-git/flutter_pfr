import 'package:cloud_firestore/cloud_firestore.dart';

class Purpose {
  final String? id;
  final String snils;
  final String phone;
  final String paymentType;
  final String date;
  final String address;
  final String comment;

  Purpose({
    this.id,
    required this.snils,
    required this.phone,
    required this.paymentType,
    required this.date,
    required this.address,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snils': snils,
      'phone': phone,
      'payment_type': paymentType,
      'date': date,
      'address': address,
      'comment': comment,
    };
  }

  factory Purpose.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;

    return Purpose(
      id: document.id,
      snils: data['snils'] as String,
      phone: data['phone'] as String,
      paymentType: data['payment_type'] as String,
      date: data['date'] as String,
      address: data['address'] as String,
      comment: data['comment'] as String,
    );
  }
}
