import 'package:cloud_firestore/cloud_firestore.dart';

class Application {
  final String? id; // id
  final String? snils; // снилс
  final String? phone; // номер телефона
  final String? paymentType; // тип выплат
  final String? dateCreate; // дата создания
  final String? dateExtension; // дата продления
  final String? address; // адрес владельца заявки
  final String? comment; // комментарий
  String? state; // состояние заявки

  Application({
    this.id,
    required this.snils,
    required this.phone,
    required this.paymentType,
    required this.dateCreate,
    required this.dateExtension,
    required this.address,
    required this.comment,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snils': snils,
      'phone': phone,
      'paymenType': paymentType,
      'dateCreate': dateCreate,
      'dateExtension': dateExtension,
      'address': address,
      'comment': comment,
      'state': state,
    };
  }

  factory Application.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final map = document.data()!;

    return Application(
      id: document.id,
      snils: map['snils'] != null ? map['snils'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      paymentType:
          map['paymenType'] != null ? map['paymenType'] as String : null,
      dateCreate:
          map['dateCreate'] != null ? map['dateCreate'] as String : null,
      dateExtension:
          map['dateExtension'] != null ? map['dateExtension'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
    );
  }
}
