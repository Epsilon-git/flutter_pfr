// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
// import 'package:pfr/models/dropped_file.dart';

class PurposeController extends GetxController {
  late DropzoneViewController dropzoneController;

  RxBool isHighlighter = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
