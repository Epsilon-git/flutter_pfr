import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/models/purpose.dart';

class ExtensionController extends GetxController {
  LoadState loadState = LoadState.isLoad;

  final _db = FirebaseFirestore.instance;

  final snilsController = TextEditingController();
  final phoneController = TextEditingController();
  final dateCreateController = TextEditingController();
  final dateController = TextEditingController(
    text: DateFormat('dd.MM.yyyy').format(DateTime.now()),
  );
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  final purposes = <Purpose>[];

  String? selectedPurpose;

  @override
  Future<void> onInit() async {
    await fetchPurposes();

    changePurpose(purposes[0].id);

    loadState = LoadState.endLoad;

    update();

    super.onInit();
  }

  fetchPurposes() async {
    final snapshot = await _db.collection('purposes').get();

    purposes.addAll(
      snapshot.docs.map((e) => Purpose.fromSnapshot(e)).toList(),
    );
  }

  changePurpose(String? value) {
    selectedPurpose = value;

    final User? user = FirebaseAuth.instance.currentUser;

    final purpose = purposes.firstWhere((e) => e.id == value);

    snilsController.text = user!.email!.replaceAll('@mail.ru', '');
    phoneController.text = purpose.phone;
    dateCreateController.text = purpose.date;
    addressController.text = purpose.address;
    commentController.text = purpose.comment;

    update();
  }
}
