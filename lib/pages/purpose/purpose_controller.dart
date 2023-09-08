// ignore_for_file: avoid_dynamic_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/models/application.dart';
import 'package:pfr/models/payment_type.dart';
import 'package:pfr/routes/app_routes.dart';

class PurposeController extends GetxController {
  static PurposeController get to => Get.find();

  LoadState loadState = LoadState.isLoad;

  final _db = FirebaseFirestore.instance;

  late DropzoneViewController dropzoneController;

  var isHighlighter = false.obs;

  String? selectedPayment;

  final payments = <PaymentType>[];

  final snilsController = TextEditingController();
  final phoneController = TextEditingController(text: '88005553535');
  final dateCreateController = TextEditingController(
    text: DateFormat('dd.MM.yyyy').format(DateTime.now()),
  );
  final addressController = TextEditingController(
    text: 'Курганская область, город Волоколамск, пл. Домодедовская, 20',
  );
  final commentController = TextEditingController(text: 'Какой-то комментарий');

  @override
  Future<void> onInit() async {
    await fetchPaymentTypes();

    final User? user = FirebaseAuth.instance.currentUser;

    snilsController.text = user!.email!.replaceAll('@mail.ru', '');

    loadState = LoadState.endLoad;

    update();

    super.onInit();
  }

  fetchPaymentTypes() async {
    final snapshot = await _db.collection('payment_types').get();

    payments.addAll(
      snapshot.docs.map((e) => PaymentType.fromSnapshot(e)).toList(),
    );

    selectedPayment = payments[0].id;
  }

  changePayment(String? value) {
    selectedPayment = value;
    update();
  }

  acceptFile(dynamic file) async {
    final fileName = await dropzoneController.getFilename(file);
    final mime = await dropzoneController.getFileMIME(file);
    final bytes = await dropzoneController.getFileSize(file);
    final url = await dropzoneController.createFileUrl(file);

    if (kDebugMode) {
      print(fileName);
      print(mime);
      print(bytes);
      print(url);
    }

    // final droppedFile = DroppedFile(
    //   bytes: bytes,
    //   fileName: fileName,
    //   mime: mime,
    //   url: url,
    // );

    isHighlighter.value = false;
  }

  pickFiles() async {
    final file = await dropzoneController.pickFiles();

    if (file.isEmpty) return;

    acceptFile(file.first);
  }

  postApplication() {
    final currentApplication = Application(
      snils: snilsController.text,
      phone: phoneController.text.trim(),
      paymentType: selectedPayment.toString(),
      dateCreate: dateCreateController.text.trim(),
      dateExtension: dateCreateController.text.trim(),
      address: addressController.text.trim(),
      comment: commentController.text.trim(),
      state: ApplicationState.isPurpose.name,
    );

    _db.collection('applications').add(currentApplication.toMap());

    Get.offAllNamed(Routes.dashboard);
  }
}
