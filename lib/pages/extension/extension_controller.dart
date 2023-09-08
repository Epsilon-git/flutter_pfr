import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/models/application.dart';
import 'package:pfr/routes/app_routes.dart';

class ExtensionController extends GetxController {
  LoadState loadState = LoadState.isLoad;

  final _db = FirebaseFirestore.instance;

  final snilsController = TextEditingController();
  final phoneController = TextEditingController();
  final dateCreateController = TextEditingController();
  final dateExtensionController = TextEditingController(
    text: DateFormat('dd.MM.yyyy').format(DateTime.now()),
  );
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  final applications = <Application>[];

  String? selectedApplication;
  Application? application;

  @override
  Future<void> onInit() async {
    await fetchApplications();

    await changePurpose(applications[0].id);

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

  changePurpose(String? value) {
    selectedApplication = value;

    final User? user = FirebaseAuth.instance.currentUser;

    application = applications.firstWhere((e) => e.id == value);

    snilsController.text = user!.email!.replaceAll('@mail.ru', '');
    phoneController.text = application!.phone!;
    dateCreateController.text = application!.dateCreate!;
    addressController.text = application!.address!;
    commentController.text = application!.comment!;

    update();
  }

  postExtensionApplication() async {
    final currentExtension = Application(
      snils: snilsController.text,
      phone: phoneController.text.trim(),
      paymentType: application!.paymentType,
      dateCreate: dateCreateController.text.trim(),
      dateExtension: dateExtensionController.text.trim(),
      address: addressController.text.trim(),
      comment: commentController.text.trim(),
      state: ApplicationState.isExtension.name,
    );

    await _db
        .collection('applications')
        .doc(selectedApplication)
        .update(currentExtension.toMap());

    Get.offAllNamed(Routes.dashboard);
  }
}
