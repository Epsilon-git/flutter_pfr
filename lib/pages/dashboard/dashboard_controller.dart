import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/models/application.dart';
import 'package:pfr/models/payment_type.dart';

class DashboardController extends GetxController {
  LoadState loadState = LoadState.isLoad;

  final _db = FirebaseFirestore.instance;

  final applications = <Application>[];

  final payments = <PaymentType>[];

  @override
  Future<void> onInit() async {
    await fetchApplications();

    await fetchPaymentTypes();

    loadState = LoadState.endLoad;

    update();

    super.onInit();
  }

  fetchApplications() async {
    final snapshot = await _db.collection('applications').get();

    applications.addAll(
      snapshot.docs.map((e) => Application.fromSnapshot(e)).toList(),
    );
  }

  fetchPaymentTypes() async {
    final snapshot = await _db.collection('payment_types').get();

    payments.addAll(
      snapshot.docs.map((e) => PaymentType.fromSnapshot(e)).toList(),
    );
  }

  String getPaymentTitleByNumber(String paymentNum) {
    final int idx = int.parse(paymentNum);

    return payments[idx].title;
  }

  String getStateByNumber(String state) {
    if (state == ApplicationState.isPurpose.name) {
      return 'Назначена';
    }

    if (state == ApplicationState.isExtension.name) {
      return 'Продлена';
    }

    if (state == ApplicationState.isTermination.name) {
      return 'Прекращена';
    }

    return 'Назначена';
  }
}
